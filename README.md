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

# Credits

-   For the idea of making this and some scripting ideas, I referred to https://github.com/cktang88/mydevenv.

# Hammerspoon

-   Credits to https://liuhao.im/english/2017/06/02/macos-automation-and-shortcuts-with-hammerspoon.html for the initial hammerspoon configuration.
-   Setup

# iTerm

-   Install iTerm
-   Go to `Preferences` -> `General` -> `Preferences` -> `Load preferences from a custom folder or URL`, and then copy the [`com.googlecode.iterm2.plist`](iterm/com.googlecode.iterm2.plist) file there.
-   Go to `Preferences` -> `Profiles` -> `Other Actions...` -> `Import JSON Profiles` -> use [iterm/Profiles.json](iterm/Profiles.json).
