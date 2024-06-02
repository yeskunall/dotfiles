#  ______   __   __   __   __   ______
# /\___  \ /\ \ /\ "-.\ \ /\ \ /\__  _\
# \/_/  /__\ \ \\ \ \-.  \\ \ \\/_/\ \/
#   /\_____\\ \_\\ \_\\"\_\\ \_\  \ \_\
#   \/_____/ \/_/ \/_/ \/_/ \/_/   \/_/


# Download `zinit`
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"

   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Init `zinit`
source "${ZINIT_HOME}/zinit.zsh";
