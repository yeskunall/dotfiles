# Load all plugins (using lucid mode)
zi wait lucid for  \
  ajeetdsouza/zoxide  \
  bezhermoso/zsh-escape-backtick  \
  lukechilds/zsh-nvm  \
  zdharma-continuum/fast-syntax-highlighting  \

# Add in Powerlevel10k without wait mode
zi ice depth=1; zinit light romkatv/powerlevel10k
