#!/bin/bash

if command -v pacman &> /dev/null
then
    sudo pacman -Syyy zsh yay tldr bat flameshot tmux curl git
fi

if command -v apt &> /dev/null
then
    sudo apt update
    sudo apt install zsh tmux bat tldr flameshot curl fonts-powerline git
fi

if command -v termux-info &> /dev/null
then
    pkg install zsh tmux bat curl git openssl
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

if ! command -v curl &> /dev/null
then
    echo "curl could not be installed/found"
    exit
fi

if ! command -v git &> /dev/null
then
    echo "git could not be installed/found"
    exit
fi

DATE=$(date +"%d%m%Y%H%M")
cp ~/.zshrc ~/.zshrc.bak-$DATE

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mv ~/.tmux.conf ~/.tmux.conf.bak-$DATE

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "setw -g mode-keys vi
set -g mouse on
set -g history-limit 20000

set -g default-terminal \"screen-256color\"
set -g status-bg colour208
set -g status-fg black

bind '\"' split-window -c \"#{pane_current_path}\"
bind % split-window -h -c \"#{pane_current_path}\"
bind c new-window -c \"#{pane_current_path}\"

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'nhdaly/tmux-better-mouse-mode'

set -g @emulate-scroll-for-no-mouse-alternate-buffer on" > ~/.tmux.conf

if ! command -v termux-info &> /dev/null
then
    echo "set-option -g default-shell /bin/zsh" >> ~/.tmux.conf
else
    chsh -s zsh
fi

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

echo 'export LC_ALL=en_US.UTF-8' >> ~/.zshrc

echo "alias tmux=\"echo 'You may not want to use this command. Execute with /usr/bin/tmux'\"" >> ~/.zshrc

if ! command -v termux-info &> /dev/null
then
    echo "alias cat=\"batcat\"" >> ~/.zshrc
else
    echo "alias cat=\"bat\"" >> ~/.zshrc
    mkdir -p ~/.termux
    cd ~/.termux
    curl -fsLo font.ttf https://github.com/Cabbagec/termux-ohmyzsh/blob/master/.termux/fonts/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf 
    echo "# Resize panes with arrow keys because alt-arrow keys doesn't work
bind-key -r Up    resize-pane -U
bind-key -r Down  resize-pane -D
bind-key -r Left  resize-pane -L
bind-key -r Right resize-pane -R
set -g @scroll-without-changing-pane on
set -g @scroll-speed-num-lines-per-scroll 1" >> ~/.tmux.conf

fi

echo "


# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'" >> ~/.tmux.conf

echo "Now close everything in the terminal and open it again to see the changes"
