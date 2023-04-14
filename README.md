<!-- omit from toc -->
# OhMyTmux

Bash script to install Tmux, ZSH and other of my favorite tools. Autoconfigures tmux to work with ZSH, adds oh-my-zsh and useful plugins.

- [Introduction](#introduction)
- [Installation](#installation)
- [Manuals and Cheatsheets](#manuals-and-cheatsheets)
- [Auto Uninstall](#auto-uninstall)
- [Manual Uninstall](#manual-uninstall)
- [Troubleshooting](#troubleshooting)
- [References](#references)

## Introduction

**Tmux** is a "terminal multiplexer", it enables a number of terminals (or windows) to be accessed and controlled from a single terminal. It allows you to create a session on a remote box, run applications in that remote session, "detach" from the session, and re-"attach" when desired. It also has advanced features such as multiple windows and split views.

The Z shell (**Zsh**) is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Zsh is an extended Bourne shell with many improvements, including some features of Bash, ksh, and tcsh.

**Oh My Zsh** is a delightful, open source, community-driven framework for managing your Zsh configuration.

So, **what is OhMyTmux**? It is an automated script that installs these tools and some more, and auto configures them to launch with your terminal. This means that when you open you terminal application (or SSH), it will launch a TMUX session, and each panel will load ZSH.
<!-- omit from toc -->
### **Please, use at your own risk.**

Currently tested working in fresh installs of latest versions (as of January 2023) of:

- Manjaro
- EndeavourOS
- Ubuntu Mate
- Termux
- Parrot
- Kali

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
- Nerd Fonts: Installs "Nerd Fonts" patched fonts (currently only for Arch*)

It also includes some aliases and useful commands I usually use. Check ```~/.zshrc``` file to see them.

OhMyTmux on a Ubuntu Mate 20.04 fresh install:

![ohmytmux_ubuntumate](https://user-images.githubusercontent.com/16118866/227494728-ec09a805-1ed4-47e4-8fab-f29708026219.png)

OhMyTmux on Termux v0.118:

![ohmytmux_termux](https://user-images.githubusercontent.com/16118866/216121625-53073dc1-7cbd-47c6-814f-1156cc2830e5.jpg)

*On other distros, you may need to download a patched font of your choice from Nerd Fonts. Please, refer to the [Troubleshooting](#troubleshooting) section.

## Installation

Download the raw ```ohmytmux.sh``` file or clone the repository, then run with:

```bash
chmod +x ohmytmux.sh
./ohmytmux.sh
```

You also can execute it automatically with wget:

```bash
bash <(wget -qO - https://github.com/rlvilla/OhMyTmux/raw/main/ohmytmux.sh)
```

or curl:

```bash
bash -c "$(curl -fsSL https://github.com/rlvilla/OhMyTmux/raw/main/ohmytmux.sh)"
```

## Manuals and Cheatsheets

To see all the available shortcuts in TMUX, press and release PREFIX (default is Ctrl+B) and ?

TMUX Cheatsheet:

https://tmuxcheatsheet.com/  

<br/>

Oh My Zsh Cheatsheet:

https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet

## Auto Uninstall

This will backup .tmux and .oh-my-zsh folders, and .tmux.conf and .zshrc files.
It also will try to restore previous versions backed up by the installation script.

Download the raw ```uninstall_ohmytmux.sh``` file or clone the repository, then run with:

```bash
chmod +x uninstall_ohmytmux.sh
./uninstall_ohmytmux.sh
```

You also can execute it automatically with wget:

```bash
bash <(wget -qO - https://github.com/rlvilla/OhMyTmux/raw/main/uninstall_ohmytmux.sh)
```

or curl:

```bash
bash -c "$(curl -fsSL https://github.com/rlvilla/OhMyTmux/raw/main/uninstall_ohmytmux.sh)"
```

## Manual Uninstall

This will wipe configurations made by the script and oh-my-tmux and TMUX Plugin Manager (TPM).

Remove ```~/.oh-my-zsh``` and ```~/.tmux``` folders, and ```~/.tmux.conf``` ```~/.zshrc``` files.

To recover previous ```~/.tmux.conf``` and ```~/.zshrc``` files, rename the auto backup done by the script with the first installation of ohmytmux back to ```~/.tmux.conf``` and ```~/.zshrc``` respectively.

## Troubleshooting

Depending on the system, terminal may not execute TMUX/ZSH automatically and may need a reboot/logout to apply the changes to the default shell.

If some symbols are missing, you may need to download a Nerd Font patched font. Download a font of your choice (or the one your terminal app is currently using) from:

https://github.com/ryanoasis/nerd-fonts

If you don't want to download a font and also don't want to see broken characters in the theme, disable tmux-power theme in ```~/.tmux.conf``` by commenting the ```set -g @plugin 'wfxr/tmux-power'``` line with a ```#```.

## References

Some parts of the code and ideas are borrowed from:

https://github.com/Cabbagec/termux-ohmyzsh/

https://github.com/tmux-plugins/tpm/issues/6

https://github.com/nhdaly/tmux-better-mouse-mode

https://gist.github.com/Neo-Oli/8c5dcb1c75b59b8bf4474105f758e9ca

https://gist.github.com/william8th/faf23d311fc842be698a1d80737d9631
