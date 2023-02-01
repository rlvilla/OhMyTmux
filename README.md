# OhMyTmux
## USE AT YOUR OWN RISK. 
 
Bash script to install Tmux, ZSH and other of my favorite tools. Autoconfigures tmux to work with ZSH, adds oh-my-zsh and plugins. Currently tested working in fresh installs of latest versions (as of January 2023) of:
- Manjaro
- EndeavourOS
- Ubuntu Mate
- Termux
- Parrot
- Kali 

This is recommended for fresh/new machines.

It may break your current installation.

Installed and configured tools are:
- ZSH 
- oh-my-zsh (with "agnoster" theme set)
- TMUX (autostarting ZSH with oh-my-zsh)
- TPM: TMUX Plugin Manager
- TMUX-Continuum: Tmux Plugin to resurrect previous session after a reboot or logout
- TMUX Better Mouse Plugin: Tmux Plugin to improve Tmux's built-in mouse mode
- Bat: an improved cat
- TLDR: simplifies man pages with examples
- Flameshot: a powerful screenshot saver

Download the raw file or clone the repository, then run with:
```
chmod +x ohmytmux.sh
./ohmytmux.sh
```

You also can execute it automatically with wget:```
```
bash <(wget -O - https://github.com/rlvilla/OhMyTmux/raw/main/ohmytmux.sh)
```

or curl:
```
sh -c "$(curl -fsSL https://github.com/rlvilla/OhMyTmux/raw/main/ohmytmux.sh)"
```
