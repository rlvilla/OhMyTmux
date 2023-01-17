#!/bin/bash

if command -v pacman &> /dev/null
then
    sudo pacman -Syyy zsh yay tldr bat flameshot tmux
fi

if command -v apt &> /dev/null
then
    sudo apt install zsh tmux bat tldr flameshot curl fonts-powerline
fi

if ! command -v zsh &> /dev/null
then
    echo "ZSH could not be installed/found"
    exit
fi

if ! command -v tmux &> /dev/null
then
    echo "TMUX could not be installed/found"
    exit
fi

DATE=$(date +"%d%m%Y%H%M")
cp ~/.zshrc ~/.zshrc.bak-$DATE

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mv ~/.tmux.conf ~/.tmux.conf.bk

echo 'set -g mouse on
set -g history-limit 20000

set -g default-terminal "screen-256color"

set -g status-bg colour208
set -g status-fg black
set-option -g default-shell /bin/zsh' > ~/.tmux.conf

sed -i 's/="robbyrussell"/="agnoster"/' ~/.zshrc

sed -i 's/plugins=(git)/plugins=(\
        git\
        zsh-autosuggestions\
        zsh-syntax-highlighting\
        tmux\
)\
\
ZSH_TMUX_AUTOSTART=true\
\
export LC_ALL=en_US.UTF-8/' ~/.zshrc

echo "Now close everything in the terminal and open it again to see the changes"

echo 'export LC_ALL=en_US.UTF-8' >> ~/.zshrc
