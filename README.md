# OhMyTmux
 
Bash script to install Tmux, ZSH and other of my favorite tools. Autoconfigures tmux to work with ZSH, adds oh-my-zsh and useful plugins. 

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Manuals and Cheatsheets](#manuals-and-cheatsheets)
3. [Auto Uninstall](#auto-uninstall)
3. [Manual Uninstall](#manual-uninstall)
3. [Troubleshooting](#troubleshooting)
5. [References](#references)

## Introduction

Currently tested working in fresh installs of latest versions (as of January 2023) of:
- Manjaro
- EndeavourOS
- Ubuntu Mate
- Termux
- Parrot
- Kali 

### Please, use at your own risk. 

This is recommended for fresh/new machines, as **it may break your current installation.** It backups and replaces previous .zshrc and .tmux.conf files, and .tmux and .oh-my-zsh folders.

Installs and configures the following tools:
- ZSH (it is set as default shell)
- oh-my-zsh (with "agnoster" theme set)
- oh-my-zsh Autosuggestions and Syntax Highlighting plugins
- TMUX (autostarting ZSH with oh-my-zsh)
- TPM: TMUX Plugin Manager
- TMUX-Continuum: Tmux Plugin to resurrect previous session after a reboot or logout
- TMUX Better Mouse Plugin: Tmux Plugin to improve Tmux's built-in mouse mode
- TMUX Yank: auto copy to clipboard when mouse selecting in TMUX
- Bat: an improved cat (no line number mode)
- TLDR: simplifies man pages with examples
- Flameshot: a powerful screenshot saver
- nano: Configures syntax highlighting 
- Nerd Fonts: Installs "Nerd Fonts" patched fonts (currently only for Arch)

It also includes some aliases and useful commands I usually use. Check ```~/.zshrc``` file to see them.

OhMyTmux on a Ubuntu Mate 20.04 fresh install:

![ohmytmux_ubuntumate](https://user-images.githubusercontent.com/16118866/227494728-ec09a805-1ed4-47e4-8fab-f29708026219.png)

OhMyTmux on Termux v0.118:

![ohmytmux_termux](https://user-images.githubusercontent.com/16118866/216121625-53073dc1-7cbd-47c6-814f-1156cc2830e5.jpg)



## Installation
Download the raw ```ohmytmux.sh``` file or clone the repository, then run with:
```
chmod +x ohmytmux.sh
./ohmytmux.sh
```

You also can execute it automatically with wget:
```
bash <(wget -qO - https://github.com/rlvilla/OhMyTmux/raw/main/ohmytmux.sh)
```

or curl:
```
bash -c "$(curl -fsSL https://github.com/rlvilla/OhMyTmux/raw/main/ohmytmux.sh)"
```

## Manuals and Cheatsheets

TMUX Cheatsheet:

https://tmuxcheatsheet.com/  

<br/>

Oh My Zsh Cheatsheet:

https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet


## Auto Uninstall
This will backup .tmux and .oh-my-zsh folders, and .tmux.conf and .zshrc files.
It also will try to restore previous versions backed up by the installation script.

Download the raw ```uninstall_ohmytmux.sh``` file or clone the repository, then run with:
```
chmod +x uninstall_ohmytmux.sh
./uninstall_ohmytmux.sh
```

You also can execute it automatically with wget:
```
bash <(wget -qO - https://github.com/rlvilla/OhMyTmux/raw/main/uninstall_ohmytmux.sh)
```

or curl:
```
bash -c "$(curl -fsSL https://github.com/rlvilla/OhMyTmux/raw/main/uninstall_ohmytmux.sh)"
```

## Manual Uninstall
This will wipe configurations made by the script and oh-my-tmux and TMUX Plugin Manager (TPM).

Remove ```~/.oh-my-zsh``` and ```~/.tmux``` folders, and ```~/.tmux.conf``` ```~/.zshrc``` files.

To recover previous ```~/.tmux.conf``` and ```~/.zshrc``` files, rename the auto backup done by the script with the first installation of ohmytmux back to ```~/.tmux.conf``` and ```~/.zshrc``` respectively.

## Troubleshooting
Depending on the system, terminal may not execute TMUX/ZSH automatically and may need a reboot/logout to apply the changes to the default shell.

If some symbols are missing, you may need to download a Nerd Font patched font. Download your font of choice (or the one your terminal app is currently using) from:

https://github.com/ryanoasis/nerd-fonts

## References
Some parts of the code and ideas are borrowed from:

https://github.com/Cabbagec/termux-ohmyzsh/

https://github.com/tmux-plugins/tpm/issues/6

https://github.com/nhdaly/tmux-better-mouse-mode

https://gist.github.com/Neo-Oli/8c5dcb1c75b59b8bf4474105f758e9ca

https://gist.github.com/william8th/faf23d311fc842be698a1d80737d9631
