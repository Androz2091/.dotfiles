# README

This is the firt time I create a `.dotfiles` repository so things are a bit messy and nothing is done automatically.

## Installation steps

- install htop/git utilities
- kubectl via k8s apt repository, kubeseal, create .kube/config and enable autocompletion by pasting the script in the .zshrc
- install node/npm after installing nvm
- install yarn via npm
- install tldr via npm
- install Obsidian via dynapt
- install Telegram via dynapt
- install code via official repo
- install ngrok via official repo 
- install zsh and oh my zsh + autocomplete plugin via official repos
- add a SSH key for GitHub/Gitlab
- add shortcuts in .zshrc
- termius via dynapt
  - sudo chown -R root:root /opt/Termius/chrome-sandbox 
  - sudo chmod 4755 /opt/Termius/chrome-sandbox 

fix for nvm
https://stackoverflow.com/questions/21215059/cant-use-nvm-from-root-or-sudo
sudo ln -s "$NVM_DIR/versions/node/$(nvm version)/bin/node" "/usr/local/bin/node"
sudo ln -s "$NVM_DIR/versions/node/$(nvm version)/bin/npm" "/usr/local/bin/npm"
sudo ln -s "$NVM_DIR/versions/node/$(nvm version)/bin/npx" "/usr/local/bin/npx"
sudo ln -s "$NVM_DIR/versions/node/$(nvm version)/bin/npx" "/usr/local/bin/npx"

gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
+ add shortcuts for i3
AND 
https://www.reddit.com/r/Ubuntu/comments/17a813o/disable_supernumber_key_to_launch_app_how/
nstall and run dconf-editor, then find /org/gnome/shell/keybindings. There you have switch-to-application-1 through switch-to-application-9, by default bound to ['<Super>1'] through ['<Super>9']. Change each of them to [] (or find a different binding that you like).

install ferdium with flatpak
setup ferdium script with cron

