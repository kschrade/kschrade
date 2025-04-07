## things to install
1. [download vscode](https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal)
2. [download rectangle](https://github.com/rxhanson/Rectangle/releases/download/v0.87/Rectangle0.87.dmg)
3. [install homebrew](https://docs.brew.sh/Installation)
   1. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
4. [install iterm2](https://iterm2.com/downloads/stable/latest)
5. [install powerline fonts](https://github.com/powerline/fonts) 
6. [install ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)  
   1. `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
  a. [install autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)  
  `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
  b. [install syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)   
  `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
7. [install nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script)
8. [install windsurf](https://windsurf.com/editor/download-confirmation?code=ma)
9. [install intellij](https://www.jetbrains.com/idea/download/download-thanks.html?platform=mac&code=IIC)

color theam for iterm2: tinacious design (dark) - [download here](https://iterm2colorschemes.com/)

## `.zshrc` config

```bash
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

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


# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# Added by Windsurf
export PATH="/Users/kyle/.codeium/windsurf/bin:$PATH"
```

brew installed commands
```bash brew install abseil giflib libpng maven readline brotli glib libslirp minikube rtmpdump ca-certificates gmp libssh mpdecimal snappy cairo gnutls libssh2 mysql sqlite capstone go libtasn1 ncurses tree colima go-task libtiff nettle unbound curl graphite2 libunistring oniguruma vde docker harfbuzz libusb openjdk vegeta docker-completion helm libx11 openjdk@17 wget docker-compose icu4c@76 libxau openssl@3 xorgproto docker-credential-helper icu4c@77 libxcb p11-kit xz dotnet jpeg-turbo libxdmcp pcre2 yarn dtc jq libxext pixman zlib expat k9s libxrender protobuf zsh-syntax-highlighting fontconfig kubernetes-cli lima python-packaging zstd freetype libevent little-cms2 python@3.11 gettext libidn2 lz4 python@3.13 gh libnghttp2 lzo qemu
```