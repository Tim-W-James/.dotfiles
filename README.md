Add sym link in Powershell:

```sh
New-Item -ItemType SymbolicLink -Path ~\.gitconfig -Target ~\.dotfiles\.gitconfig
```

Add sym link in bash:

```sh
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```
