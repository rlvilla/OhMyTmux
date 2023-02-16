#!/bin/bash

echo "This will backup .tmux and .oh-my-zsh folders, and .tmux.conf and .zshrc files."
echo "It also will try to restore previous versions backed up by the installation script."
echo ""
read -p "Are you sure you wish to continue? (yes/no) "
if [ "$REPLY" != "yes" ]; then
   exit
fi

DATE=$(date +"%d-%m-%Y_%H-%M")

mv ~/.oh-my-zsh ~/.oh-my-zsh-ohmytmux-$DATE
mv ~/.tmux ~/.tmux-ohmytmux-$DATE
mv ~/.zshrc ~/.zshrc.temp
mv ~/.tmux.conf ~/.tmux.conf.temp

if [[ $(find ~/ -maxdepth 1 -iname ".zshrc*" | wc -l) == 1 ]]; then 
    echo "No previous version of .zshrc found. ZSH will ask you next time to set up the file."
    echo ""
else
    find ~/ -maxdepth 1 -iname ".zshrc.bak*" -printf "%T@ %Tc %p\n" | sort -n | tail -n 1 | awk -F "/" '{print $NF}' | xargs -I ARG sh -c 'mv ARG ~/.zshrc'  
fi


if [[ $(find ~/ -maxdepth 1 -iname ".zshrc*" | wc -l) == 1 ]]; then 
    echo "No previous version of .tmux.conf found. TMUX will run with default settings"
    echo ""
else
    find ~/ -maxdepth 1 -iname ".tmux.conf.bak*" -printf "%T@ %Tc %p\n" | sort -n | tail -n 1 | awk -F "/" '{print $NF}' | xargs -I ARG sh -c 'mv ARG ~/.tmux.conf' 
fi 

mv ~/.zshrc.temp ~/.zshrc.bak-ohmytmux-$DATE
mv ~/.tmux.conf.temp ~/.tmux.conf.bak-ohmytmux-$DATE

echo ""
echo "OhMyTmux removed"

echo "Default shell is ZSH."
read -p "Do you want to revert back to bash? (yes/no) "
if [ "$REPLY" != "yes" ]; then
   exit
fi

chsh -s /bin/bash