# config

Contains collection of things I use for my setup.

# Setup

```bash
git clone git@github.com:gfting/config.git
cd config
chmod a+x ./install.sh
sudo ./install.sh
source ./install.sh #(can't simply execute script)
source ~/.cargo/env # update PATH for rust tooling
```

## Additional manual setup

-   Install Hammerspoon [or `brew cask install hammerspoon`]
-   Install VSCode [or `brew cask install visual-studio-code`]
-   Install VSCode extensions

# Credits

-   For the idea of making this and some scripting ideas, I referred to https://github.com/cktang88/mydevenv.
-   This also helped me find some interesting things https://sourabhbajaj.com/mac-setup/Homebrew/Cask.html

# Hammerspoon

-   Credits to https://liuhao.im/english/2017/06/02/macos-automation-and-shortcuts-with-hammerspoon.html for the initial hammerspoon configuration.

## Some Commands

-   Window sizing using cmd + opt + (arrows || enter)
-   Quick app opening with opt + \_
    -   c = Chrome
    -   v = VSCode
    -   t = iTerm
    -   n = Notion
    -   s = Slack

## Setup

-   First, install HammerSpoon.
-   The script will automatically overwrite the existing `~/.hammerspoon/init.lua` file.
-   Hit `Reload Config` if nothing is working.

# iTerm

-   Install iTerm [should happen in script]
-   Go to `Preferences` -> `General` -> `Preferences` -> `Load preferences from a custom folder or URL`, and then copy the [`com.googlecode.iterm2.plist`](iterm/com.googlecode.iterm2.plist) file there.
-   Go to `Preferences` -> `Profiles` -> `Other Actions...` -> `Import JSON Profiles` -> use [iterm/Profiles.json](iterm/Profiles.json).

# VSCode

-   Install VSCode [should happen via script]
-   If not installed, [install the `code` command line](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line)
-   Open the command palette, and select `Settings (JSON)`. Then, copy-paste the settings.json over.
-   The script could probably do `~Library/Application Support/Code/User/settings.json`, but I'm not always confident that it transitions well.

## VSCode extensions

-   GitLens
-   Python
-   ESLint
-   Jest
-   Jest runner
-   Output colorizer
-   Path intellisense
-   Import Cost
-   tslint
-   Theme: Material Palenight High Contrast
-   Icons: material-icon-theme

# Fish

-   The script should `brew install fish`, and then install oh-my-fish, and install some necessary fonts.
-   Once the script is over, manually run `omf install bobthefish` to install the bobthefish theme, and walk through the setup.
-   The script will copy over the [./fish](./fish) folder to `~/.config/fish`, the default location of fish configurations.

# Zsh + mods

:fire: :fire: :fire: Run `install.sh` after installing the extensions below

How to install extensions - https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh

-   [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
-   [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)
-   Zsh autocorrect enabled default
-   [colored-man-pages](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh)
-   [fzf extension](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf) -- auto installed w/ `fzf`
-   [fasd extension](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fasd)

## aliases

```bash
# custom
alias ff="firefox"
alias tn="thunar"

alias sai="sudo apt install"
alias sau="sudo apt update"

alias fzfp="fzf --preview 'bat --style=numbers --color=always {} | head -500'"

alias fd="fdfind"

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias z='fasd_cd -d'     # cd, same as z,j,autojump

# from fasd zsh plugin
alias v='fasd -f -e "$EDITOR"'
alias o="fasd -a -e xdg-open"
alias j="fasd_cd -d -i"
```

# Misc

## Fonts

-   I use Source Code Pro, which can be downloaded [here](https://fonts.google.com/specimen/Source+Code+Pro). However, the `install.sh` should also download it.
-   However, this can result in the font being downloaded as "Source Code Pro for Powerline", which will need to be adjusted in the VSCode settings, or it'd result in some weird errors.

## Git

-   Useful gitignore generator: https://www.gitignore.io/?templates=macos
