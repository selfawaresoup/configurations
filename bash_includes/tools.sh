# file for tools like NVM, RVM, Cargo, etc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(rbenv init -)"

. "$HOME/.cargo/env"