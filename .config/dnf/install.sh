#!/usr/bin/env bash
#
# Fedora Package Installer
# Equivalent to `brew bundle` for Fedora
#
# Usage: ./install.sh [options]
#   --all         Install everything (default)
#   --copr        Enable COPR repositories only
#   --packages    Install DNF packages only
#   --flatpak     Install Flatpak packages only
#   --manual      Install manual packages only
#   --dry-run     Show what would be installed without installing
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=false

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

run_cmd() {
    if [[ "$DRY_RUN" == "true" ]]; then
        echo "  Would run: $*"
    else
        "$@"
    fi
}

# Check if running on Fedora
check_fedora() {
    if [[ ! -f /etc/fedora-release ]]; then
        log_error "This script is designed for Fedora Linux"
        exit 1
    fi
    log_info "Detected Fedora $(cat /etc/fedora-release)"
}

# Enable RPM Fusion repositories (needed for ffmpeg with full codecs)
enable_rpmfusion() {
    log_info "Enabling RPM Fusion repositories..."
    if ! rpm -q rpmfusion-free-release &>/dev/null; then
        run_cmd sudo dnf install -y \
            "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
            "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
        log_success "RPM Fusion enabled"
    else
        log_info "RPM Fusion already enabled"
    fi
}

# Enable COPR repositories
enable_copr_repos() {
    log_info "Enabling COPR repositories..."

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Skip comments and empty lines
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line// }" ]] && continue

        repo=$(echo "$line" | awk '{print $1}')
        if [[ -n "$repo" ]]; then
            log_info "Enabling COPR: $repo"
            run_cmd sudo dnf copr enable -y "$repo" || log_warning "Failed to enable $repo"
        fi
    done < "$SCRIPT_DIR/copr.txt"

    log_success "COPR repositories enabled"
}

# Install DNF packages
install_dnf_packages() {
    log_info "Installing DNF packages..."

    local packages=()

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Skip comments and empty lines
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line// }" ]] && continue

        # Extract package name (before any # comment)
        pkg=$(echo "$line" | awk '{print $1}')
        if [[ -n "$pkg" ]]; then
            packages+=("$pkg")
        fi
    done < "$SCRIPT_DIR/packages.txt"

    if [[ ${#packages[@]} -gt 0 ]]; then
        log_info "Installing ${#packages[@]} packages..."
        run_cmd sudo dnf install -y "${packages[@]}" || true
        log_success "DNF packages installed"
    fi
}

# Setup Flatpak and install packages
install_flatpak_packages() {
    log_info "Setting up Flatpak..."

    # Ensure Flatpak is installed
    if ! command -v flatpak &>/dev/null; then
        run_cmd sudo dnf install -y flatpak
    fi

    # Add Flathub repository
    if ! flatpak remotes | grep -q flathub; then
        run_cmd flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
        log_success "Flathub repository added"
    fi

    log_info "Installing Flatpak packages..."

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Skip comments and empty lines
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line// }" ]] && continue

        # Extract app ID (before any # comment)
        app=$(echo "$line" | awk '{print $1}')
        if [[ -n "$app" ]]; then
            log_info "Installing Flatpak: $app"
            run_cmd flatpak install -y flathub "$app" || log_warning "Failed to install $app"
        fi
    done < "$SCRIPT_DIR/flatpak.txt"

    log_success "Flatpak packages installed"
}

# Install packages that require manual installation
install_manual_packages() {
    log_info "Installing packages that require manual installation..."

    # Bun
    if ! command -v bun &>/dev/null; then
        log_info "Installing Bun..."
        run_cmd curl -fsSL https://bun.sh/install | bash
    else
        log_info "Bun already installed"
    fi

    # Flyctl
    if ! command -v flyctl &>/dev/null; then
        log_info "Installing flyctl..."
        run_cmd curl -L https://fly.io/install.sh | sh
    else
        log_info "flyctl already installed"
    fi

    # Zinit
    if [[ ! -d "${ZINIT_HOME:-$HOME/.local/share/zinit}" ]]; then
        log_info "Installing zinit..."
        run_cmd bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
    else
        log_info "zinit already installed"
    fi

    # Git-town
    if ! command -v git-town &>/dev/null; then
        log_info "Installing git-town..."
        local version
        version=$(curl -s https://api.github.com/repos/git-town/git-town/releases/latest | grep tag_name | cut -d '"' -f 4)
        run_cmd curl -L "https://github.com/git-town/git-town/releases/download/${version}/git-town_linux_amd64.tar.gz" | tar xz -C /tmp
        run_cmd sudo mv /tmp/git-town /usr/local/bin/
    else
        log_info "git-town already installed"
    fi

    # AWS Vault
    if ! command -v aws-vault &>/dev/null; then
        log_info "Installing aws-vault..."
        local version
        version=$(curl -s https://api.github.com/repos/99designs/aws-vault/releases/latest | grep tag_name | cut -d '"' -f 4)
        run_cmd sudo curl -L "https://github.com/99designs/aws-vault/releases/download/${version}/aws-vault-linux-amd64" -o /usr/local/bin/aws-vault
        run_cmd sudo chmod +x /usr/local/bin/aws-vault
    else
        log_info "aws-vault already installed"
    fi

    # dprint
    if ! command -v dprint &>/dev/null; then
        log_info "Installing dprint..."
        run_cmd curl -fsSL https://dprint.dev/install.sh | sh
    else
        log_info "dprint already installed"
    fi

    # Vale
    if ! command -v vale &>/dev/null; then
        log_info "Installing vale..."
        local version
        version=$(curl -s https://api.github.com/repos/errata-ai/vale/releases/latest | grep tag_name | cut -d '"' -f 4)
        run_cmd curl -L "https://github.com/errata-ai/vale/releases/download/${version}/vale_${version#v}_Linux_64-bit.tar.gz" | tar xz -C /tmp
        run_cmd sudo mv /tmp/vale /usr/local/bin/
    else
        log_info "vale already installed"
    fi

    # Lazydocker
    if ! command -v lazydocker &>/dev/null; then
        log_info "Installing lazydocker..."
        run_cmd curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
    else
        log_info "lazydocker already installed"
    fi

    # Turso CLI
    if ! command -v turso &>/dev/null; then
        log_info "Installing Turso CLI..."
        run_cmd curl -sSfL https://get.tur.so/install.sh | bash
    else
        log_info "Turso CLI already installed"
    fi

    # Fastly CLI
    if ! command -v fastly &>/dev/null; then
        log_info "Installing Fastly CLI..."
        local version
        version=$(curl -s https://api.github.com/repos/fastly/cli/releases/latest | grep tag_name | cut -d '"' -f 4)
        run_cmd curl -L "https://github.com/fastly/cli/releases/download/${version}/fastly_${version#v}_linux_amd64.tar.gz" | tar xz -C /tmp
        run_cmd sudo mv /tmp/fastly /usr/local/bin/
    else
        log_info "Fastly CLI already installed"
    fi

    # IPinfo CLI
    if ! command -v ipinfo &>/dev/null; then
        log_info "Installing IPinfo CLI..."
        run_cmd curl -Ls https://github.com/ipinfo/cli/releases/download/ipinfo-3.3.1/ipinfo_3.3.1_linux_amd64.tar.gz | tar xz -C /tmp
        run_cmd sudo mv /tmp/ipinfo_3.3.1_linux_amd64 /usr/local/bin/ipinfo
    else
        log_info "IPinfo CLI already installed"
    fi

    # qsv
    if ! command -v qsv &>/dev/null; then
        log_info "Installing qsv..."
        local version
        version=$(curl -s https://api.github.com/repos/jqnatividad/qsv/releases/latest | grep tag_name | cut -d '"' -f 4)
        run_cmd curl -L "https://github.com/jqnatividad/qsv/releases/download/${version}/qsv-${version}-x86_64-unknown-linux-gnu.zip" -o /tmp/qsv.zip
        run_cmd unzip -o /tmp/qsv.zip -d /tmp/qsv
        run_cmd sudo mv /tmp/qsv/qsv* /usr/local/bin/
        run_cmd rm -rf /tmp/qsv /tmp/qsv.zip
    else
        log_info "qsv already installed"
    fi

    # NPM global packages (requires Node.js via mise or system)
    if command -v npm &>/dev/null; then
        log_info "Installing npm global packages..."
        run_cmd npm install -g cfonts fx || log_warning "Failed to install npm packages"
    else
        log_warning "npm not found - skipping cfonts and fx installation"
        log_info "Install Node.js via mise, then run: npm install -g cfonts fx"
    fi

    # Cargo packages (requires Rust via mise or system)
    if command -v cargo &>/dev/null; then
        log_info "Installing cargo packages..."
        run_cmd cargo install htmlq icann-rdap sniffnet || log_warning "Failed to install some cargo packages"
    else
        log_warning "cargo not found - skipping htmlq, icann-rdap, sniffnet installation"
        log_info "Install Rust via mise, then run: cargo install htmlq icann-rdap sniffnet"
    fi

    # q DNS tool
    if ! command -v q &>/dev/null; then
        log_info "Installing q (DNS tool)..."
        local version
        version=$(curl -s https://api.github.com/repos/natesales/q/releases/latest | grep tag_name | cut -d '"' -f 4)
        run_cmd curl -L "https://github.com/natesales/q/releases/download/${version}/q_${version#v}_linux_amd64.tar.gz" | tar xz -C /tmp
        run_cmd sudo mv /tmp/q /usr/local/bin/
    else
        log_info "q already installed"
    fi

    # sq data wrangler
    if ! command -v sq &>/dev/null; then
        log_info "Installing sq..."
        local version
        version=$(curl -s https://api.github.com/repos/neilotoole/sq/releases/latest | grep tag_name | cut -d '"' -f 4)
        run_cmd curl -L "https://github.com/neilotoole/sq/releases/download/${version}/sq_linux_amd64.tar.gz" | tar xz -C /tmp
        run_cmd sudo mv /tmp/sq /usr/local/bin/
    else
        log_info "sq already installed"
    fi

    log_success "Manual packages installed"
}

# Install VSCode/VSCodium extensions
install_vscode_extensions() {
    log_info "Installing VSCode/VSCodium extensions..."

    local cmd=""
    if command -v codium &>/dev/null; then
        cmd="codium"
    elif command -v code &>/dev/null; then
        cmd="code"
    else
        log_warning "VSCodium/VSCode not found, skipping extensions"
        return
    fi

    local extensions=(
        "orta.vscode-jest"
        "redhat.vscode-yaml"
        "vue.volar"
    )

    for ext in "${extensions[@]}"; do
        log_info "Installing extension: $ext"
        run_cmd "$cmd" --install-extension "$ext" || log_warning "Failed to install $ext"
    done

    log_success "VSCode extensions installed"
}

# Install Go packages
install_go_packages() {
    if ! command -v go &>/dev/null; then
        log_warning "Go not found, skipping Go packages"
        log_info "Install Go via mise, then run this script again with --manual"
        return
    fi

    log_info "Installing Go packages..."
    run_cmd go install cmd/go@latest || true
    run_cmd go install cmd/gofmt@latest || true
    log_success "Go packages installed"
}

# Print summary
print_summary() {
    echo ""
    echo "============================================"
    log_success "Installation complete!"
    echo "============================================"
    echo ""
    echo "Post-installation notes:"
    echo "  1. Restart your shell or run: source ~/.zshrc"
    echo "  2. Set up mise: mise install"
    echo "  3. Configure GPG: gpg --full-generate-key"
    echo "  4. Log in to services: gh auth login, flyctl auth login, etc."
    echo ""
    echo "Some packages may need additional configuration:"
    echo "  - Tailscale: sudo tailscale up"
    echo "  - Ollama: ollama pull <model>"
    echo "  - Redis: sudo systemctl enable --now redis"
    echo "  - PostgreSQL: sudo systemctl enable --now postgresql"
    echo ""
}

# Main installation
main() {
    local install_copr=false
    local install_packages=false
    local install_flatpak=false
    local install_manual=false
    local install_all=true

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --copr)
                install_copr=true
                install_all=false
                ;;
            --packages)
                install_packages=true
                install_all=false
                ;;
            --flatpak)
                install_flatpak=true
                install_all=false
                ;;
            --manual)
                install_manual=true
                install_all=false
                ;;
            --dry-run)
                DRY_RUN=true
                log_warning "Dry run mode - no changes will be made"
                ;;
            --all)
                install_all=true
                ;;
            -h|--help)
                echo "Usage: $0 [options]"
                echo "  --all         Install everything (default)"
                echo "  --copr        Enable COPR repositories only"
                echo "  --packages    Install DNF packages only"
                echo "  --flatpak     Install Flatpak packages only"
                echo "  --manual      Install manual packages only"
                echo "  --dry-run     Show what would be installed"
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                exit 1
                ;;
        esac
        shift
    done

    check_fedora

    if [[ "$install_all" == "true" ]]; then
        enable_rpmfusion
        enable_copr_repos
        install_dnf_packages
        install_flatpak_packages
        install_manual_packages
        install_vscode_extensions
        install_go_packages
        print_summary
    else
        [[ "$install_copr" == "true" ]] && { enable_rpmfusion; enable_copr_repos; }
        [[ "$install_packages" == "true" ]] && install_dnf_packages
        [[ "$install_flatpak" == "true" ]] && install_flatpak_packages
        [[ "$install_manual" == "true" ]] && { install_manual_packages; install_vscode_extensions; install_go_packages; }
    fi
}

main "$@"
