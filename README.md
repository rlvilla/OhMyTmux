# OhMyTmux
## USE AT YOUR OWN RISK. 
 
Bash script to install Tmux, ZSH and other of my favorite tools. Autoconfigures tmux to work with ZSH, adds oh-my-zsh and useful plugins. 

Currently tested working in fresh installs of latest versions (as of January 2023) of:
- Manjaro
- EndeavourOS
- Ubuntu Mate
- Termux
- Parrot
- Kali 

This is recommended for fresh/new machines, as **it may break your current installation.** Backups and replaces previous .zshrc and .tmux.conf files.

Installs and configures the following tools:
- ZSH 
- oh-my-zsh (with "agnoster" theme set)
- TMUX (autostarting ZSH with oh-my-zsh)
- TPM: TMUX Plugin Manager
- TMUX-Continuum: Tmux Plugin to resurrect previous session after a reboot or logout
- TMUX Better Mouse Plugin: Tmux Plugin to improve Tmux's built-in mouse mode
- Bat: an improved cat
- TLDR: simplifies man pages with examples
- Flameshot: a powerful screenshot saver

## Installation
Download the raw file or clone the repository, then run with:
```
chmod +x ohmytmux.sh
./ohmytmux.sh
```

You also can execute it automatically with wget:
```
bash <(wget -O - https://github.com/rlvilla/OhMyTmux/raw/main/ohmytmux.sh)
```

or curl:
```
sh -c "$(curl -fsSL https://github.com/rlvilla/OhMyTmux/raw/main/ohmytmux.sh)"
```

## References
Some parts of the code and ideas are borrowed from:
https://github.com/Cabbagec/termux-ohmyzsh/
https://github.com/tmux-plugins/tpm/issues/6
https://github.com/nhdaly/tmux-better-mouse-mode
https://gist.github.com/Neo-Oli/8c5dcb1c75b59b8bf4474105f758e9ca