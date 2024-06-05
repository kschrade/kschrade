## things to install
1. [download vscode](https://code.visualstudio.com/download)
2. [download rectangle](https://rectangleapp.com/)
3. [install homebrew](https://docs.brew.sh/Installation)
4. [install iterm2](https://iterm2.com/)
5. [install ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)  
  a. [install autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)  
  b. [install syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)  
6. [install nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script)

## `.zshrc` config

```bash
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

plugins=(
  git
  yarn
  colored-man-pages
  colorize
  golang
  kubectl
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias mate="code"
alias dpa='docker rmi $(docker images -a|grep "<none>"|awk '$1=="<none>" {print $3}')'

# allow "bad" apps
alias allowbadapps='sudo spctl --master-enable'
alias cleaning='docker rmi -f $(docker images -q -f "dangling=true")'

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#vs code aliases
export VSCODE="code"
alias vsc="$VSCODE ."
alias vsca="$VSCODE --add"
alias vscd="$VSCODE --diff"
alias vscg="$VSCODE --goto"
alias vscn="$VSCODE --new-window"
alias vscr="$VSCODE --reuse-window"
alias vscw="$VSCODE --wait"
alias vscu="$VSCODE --user-data-dir"


# find and load an .nvmrc if it exists (thanks, Avery)
load-nvmrc() {
 if [[ ( -f .nvmrc && -r .nvmrc ) ||
       ( -f ../.nvmrc && -r ../.nvmrc ) ||
       ( -f ../../.nvmrc && -r ../../.nvmrc ) ||
       ( -f ../../../.nvmrc && -r ../../../.nvmrc ) ||
       ( -f ../../../../.nvmrc && -r ../../../../.nvmrc ) ||
       ( -f ../../../../../.nvmrc && -r ../../../../../.nvmrc ) ]]; then
   nvm use
 elif [[ $(nvm version) != $(nvm version default) ]]; then
   echo "Reverting to nvm default version"
   nvm use default
 fi
}
# overload cd to also run load-nvmrc
cd() {
 if [[ $1 == "" ]]; then
   builtin cd && load-nvmrc
 else
   builtin cd "$1" && load-nvmrc
 fi
}

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

```
