# Simon's Dotfiles

The goal of this repository is not to automate everything but to have a reference of what I usually install and how I configure my system to help me move to a new machine faster.

## Configuration steps

### Daily tools

Ordered by the order I should install/setup the tools. Steps that require the previous computer's data are marked with ⚠️.

- Firefox
- `zsh` and Oh My Zsh + autocomplete plugin
- `htop`
- `git`
- Docker
- `kubectl`
- `kubeseal`
- ⚠️ (key) create a `.kube/config` file
- enable kubectl autocompletion by pasting the script in the `.zshrc`
- `nvm`
- `node`/`npm` using `nvm`
- `yarn` via `npm`
- `pnpm` via `npm`
- `tldr` via `npm`
- ⚠️ Obsidian
- Telegram
- ⚠️ (extensions) VS Code
- `ngrok`
- ⚠️ (key) setup SSH keys for GitHub/Gitlab
- Termius
- Whatsapp (ZapZap sur Linux)
- Slack
- Spotify
- GitKraken
- ⚠️ (config) DBeaver
- Warp
- Cursor
- Calibre
- TeamViewer

### VS Code extensions

- Error Lens (Alexander)
- Emoji (Perkovec)
- Effect Dev Tools (Effectful Technologies)
- Remove comments (pblibither8)
- vscode-pdf (tomoki1207)
- xstate vscode (stately)
- Wakatime (wakatime)
- Flow icons (thang nguyen)
- Tinymist Typst (riad Dreamin)

### Other configuration steps

setup shortcuts to:
- open an app (cmd + d)
- open the terminal (cmd + t)
- close an app (cmd + shift + tab)

add git shortcuts
```
git config --global alias.cmp '!f() { git add -A && git commit -m "$@" && git push; }; f'
```

### Ubuntu specifics

```sh
alias epflvpn="openconnect --useragent=AnyConnect vpn.epfl.ch"
```

### MacOS specifics

- Rectangle
- AppCleaner
- RapidAPI
- GrandPerspective
- `git config --global core.excludesfile ~/.gitignore` + `echo .DS_Store >> ~/.gitignore`
