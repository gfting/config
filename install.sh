#!/bin/bash

########################################################
# Run this script with sudo permissions
########################################################

set -o verbose #echo commands

########################################################
### DEPENDENCIES
# Install some large binaries using cask
brew tap caskroom/cask

## Adds necessary packages
# apt install curl build-essential checkinstall libssl-dev

########################################################
### iTERM
brew cask install iterm

########################################################
### HAMMERSPOON
# add the hammerspoon config
cp ./hammerspoon/init.lua ~/.hammerspoon/init.lua

########################################################
### FISH
brew install fish

# copy the fish configuration over to the config file
cp -r ./fish ~/.config/fish

curl -L https://get.oh-my.fish | fish

### Get Powerline Fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

########################################################
### ZSH
brew update

# install zsh
if ! command -v zsh; then
  brew install zsh
fi

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install basic plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# copy .zshrc
cp ./.zshrc ~/.zshrc
source ~/.zshrc


##############################
### VIM
# to support new vim
apt install vim-gui-common
cp ./.vimrc ~/.vimrc

# install basic mac vim ide
brew cask install macvim
##############################
### Install Node and NPM
if ! command -v node; then
  brew install node
fi

##############################
### Languages
# install Rust, https://www.rust-lang.org/tools/install
if ! command -v rustc; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source ~/.cargo/env
fi

# # install Ruby
# if ! command -v ruby; then
#   apt install -y ruby
# fi

#################################m#######################
# Improved tooling
########################################################

# NodeJS version manager, https://github.com/tj/n (see also: https://github.com/tj/n#third-party-installers)
npm i -g n
n latest

# tldr: improved 'man', https://github.com/tldr-pages/tldr
npm i -g tldr

# exa: improved 'ls', https://github.com/ogham/exa
cargo install exa


# bat: improved 'cat', https://github.com/sharkdp/bat

# fasd: cd with frequency memory

# fzf: fuzzy finder, https://github.com/junegunn/fzf

# fd: improved 'find', https://github.com/sharkdp/fd/ 
# (note: binary is named `fdfind`, aliased to `fd` in .zshrc)

# httpie: improved 'curl', https://github.com/jakubroztocil/httpie/

# ripgrep: improved 'grep', https://github.com/BurntSushi/ripgrep

brew install fd fzf fasd bat httpie rigrep
# install fzf to shell scripts [should already be installed, though]
$(brew --prefix)/opt/fzf/install

################################################################
### Some Git settings
## Make a base git config file
# cp gitignore ~/.gitignore
# git config --global core.excludesfile ~/.gitignore

########################################################
# Set default shell as zsh
########################################################

chsh -s $(which zsh)

set +o verbose # echo commands off


########################################################
## Unused things for Linux, etc

# # Set up FUSUMA for multi-touch gestures
# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#   if ! command -v fusuma; then
#     apt install libinput-tools xdotool
#     gem install fusuma
#   fi
#   mkdir -p ~/.config/fusuma # only creates if dir doesn't already exist
#   cp ./fusuma/config.yml ~/.config/fusuma/config.yml
# fi

# ########################################################
# # XFCE Themeing
# ########################################################

# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#   if [[ $(ps -e | grep -E -i "xfce4") ]]; then
#     # Adwaita xfce theme
#     xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
#     # papirus dark icons
#     wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh
#     xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"

#     # set window manager theme to Numix
#     xfconf-query -c xfwm4 -p /general/theme -s "Numix"
#   fi
# fi