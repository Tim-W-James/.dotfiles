## Software Setup
https://www.notion.so/timwjames/Software-Setup-91e7584487c643ca98d9e9aea10d5d52

## Add sym link in Powershell:

```sh
New-Item -ItemType SymbolicLink -Path ~\.gitconfig -Target ~\.dotfiles\.gitconfig
```

## Add sym link in bash:

```sh
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```
