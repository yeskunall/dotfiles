# Load all plugins (using lucid mode)
zi wait lucid for  \
  Aloxaf/fzf-tab  \
  ajeetdsouza/zoxide  \
  bezhermoso/zsh-escape-backtick  \
  lukechilds/zsh-nvm  \
  make"PREFIX=$ZPFX" tj/git-extras \
  zdharma-continuum/fast-syntax-highlighting  \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-completions

# Add in Powerlevel10k without wait mode
zi ice depth=1; zinit light romkatv/powerlevel10k

# Pull in snippets
zi snippet OMZP::aws # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aws
zi snippet OMZP::colored-man-pages # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages
zi snippet OMZP::command-not-found # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found
