#!/bin/bash

if command -v pacman &> /dev/null
then
    sudo pacman -Syyy --needed zsh yay tldr bat flameshot tmux curl git xclip ttf-nerd-fonts-symbols-1000-em-mono
fi

if command -v sudo &> /dev/null && command -v apt &> /dev/null
then
    sudo apt update
    sudo apt install -y zsh tmux bat tldr flameshot curl fonts-powerline git xclip
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

DATE=$(date +"%d-%m-%Y_%H-%M")

echo "Backing up previous ZSH, OhMyZsh and TMUX conf files..."

mv ~/.zshrc ~/.zshrc.bak-pre-ohmytmux-$DATE
mv ~/.tmux.conf ~/.tmux.conf.bak-pre-ohmytmux-$DATE
mv ~/.oh-my-zsh ~/.oh-my-zsh-pre-ohmytmux-$DATE
mv ~/.tmux ~/.tmux-pre-ohmytmux-$DATE

echo "Beginning setup..."

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

set -g @plugin 'wfxr/tmux-power'
set -g @tmux_power_theme '#ff8700'

set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @continuum-restore 'on'
set -g @resurrect-capture-pane-contents 'on'
set -g @continuum-save-interval '5'

set -g @plugin 'tmux-plugins/tmux-yank'

set -g @yank_selection_mouse 'clipboard'

set -g @emulate-scroll-for-no-mouse-alternate-buffer on

unbind C-b
# This sets current tmux prefix to the already default Ctrl+B, but makes it easy to change your prefix in the future
# Just modify C-b in the next two lines with any combination you like. C is for Control key, M for Alt.
set-option -g prefix C-b
bind-key C-b send-prefix" > ~/.tmux.conf

chmod 755 ~/.tmux
mkdir ~/.tmux/resurrect

echo "\nChanging default shell..."

if ! command -v termux-info &> /dev/null
then
    echo "set-option -g default-shell /bin/zsh" >> ~/.tmux.conf
    chsh -s /usr/bin/zsh
else
    chsh -s zsh
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

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

echo "setopt CHASE_LINKS" >> ~/.zshrc

echo "alias ipa=\"ip -brief a\"" >> ~/.zshrc

echo "alias getip=\"wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1 | sed 's/ //g'\"" >> ~/.zshrc

echo "alias hg=\"history | grep -i\"" >> ~/.zshrc

if ! command -v termux-info &> /dev/null
then
    if ! command -v bat &> /dev/null
    then
        echo "alias cat=\"batcat --style=plain\"" >> ~/.zshrc
        echo "export MANPAGER=\"sh -c 'col -bx | batcat -l man -p'\"" >> ~/.zshrc
    else
        echo "alias cat=\"bat --style=plain\"" >> ~/.zshrc
        echo "export MANPAGER=\"sh -c 'col -bx | bat -l man -p'\"" >> ~/.zshrc
    fi
else
    echo "alias cat=\"bat --style=plain\"" >> ~/.zshrc
    echo "export MANPAGER=\"sh -c 'col -bx | bat -l man -p'\"" >> ~/.zshrc
    mkdir -p ~/.termux
    cd ~/.termux
    curl -fsLo font.ttf https://github.com/Cabbagec/termux-ohmyzsh/raw/master/.termux/fonts/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf 
    termux-reload-settings
    echo "# Resize panes with arrow keys because alt-arrow keys doesn't work
bind-key -r Up    resize-pane -U
bind-key -r Down  resize-pane -D
bind-key -r Left  resize-pane -L
bind-key -r Right resize-pane -R
set -g @scroll-without-changing-pane on
set -g @scroll-speed-num-lines-per-scroll 1" >> ~/.tmux.conf
#termux-fix-shebang ~/.tmux/plugins/tpm/scripts/install_plugins.sh

fi

if command -v nano &> /dev/null && ! test -f ~/.nanorc
then
    ls -1 /usr/share/nano/*.nanorc | sed 's/^\//include \//' >> ~/.nanorc
fi

echo "

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'" >> ~/.tmux.conf

~/.tmux/plugins/tpm/scripts/install_plugins.sh

NC='\033[0m' # No Color
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

echo ""
echo ""
echo -e "${GREEN}OhMyTmux Installed!"
echo ""
echo -e "Now, oh-my-zsh and TMUX will run.${NC}"
echo ""
echo -ne "${YELLOW}In some terminals like the one in Ubuntu, you may need to logout and login to have ZSH and TMUX executed automatically in new instances${NC}"
echo ""
read -p "Press enter to continue..."

zsh