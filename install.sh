#!/bin/bash
# Dotfiles installator
#
# Author: Anton Linevych <anton@linevich.net>
# URL: https://github.com/linevich/dotfiles

# Font styles shotrcuts
B="\e[1m"
N="\e[0m"

# Paths
I3_CONFIG_DIR=$HOME/.i3
I3_CONFIG_PATH=$I3_CONFIG_DIR/config
I3_BLOCKS_PATH=$HOME/.i3blocks.conf
ROFI_CONFIG_DIR=$HOME/.config/rofi
ROFI_CONFIG_PATH=$ROFI_CONFIG_DIR/config

# Helper functions

function list_tasks () {
    typeset -f | awk '/ \(\) $/ && !/^main / {print $1}' | grep "do__"
}

function count_tasks () {
    typeset -f | awk '/ \(\) $/ && !/^main / {print $1}' | grep "do__" | wc -l
}

function check_installation () {
    which $1 &> /dev/null || echo -e "${B}Warning: ${1} is not installed!${N} "
}

# Taks. Should begin from do__

function do__install_i3_config () {
    echo -e "Updating i3 configuration..."
    mkdir -p $I3_CONFIG_DIR
    ln -sf "$(pwd)/i3.conf" $I3_CONFIG_PATH
    {
        i3-msg reload &> /dev/null
    } || {
        echo "Could not restart i3..."
        check_installation i3
    }
}

function do__install_i3_blocks () {
    echo -e "Updating i3blocks"
    ln -sf "$(pwd)/i3blocks.conf" $I3_BLOCKS_PATH
    check_installation i3blocks
}

function do__install_rofi_config () {
    echo -e "Updating rofi configuration ..."
    mkdir -p $ROFI_CONFIG_DIR
    ln -sf "$(pwd)/rofi.conf" $ROFI_CONFIG_PATH
    check_installation rofi
}


cat ./ascii.txt
echo
echo -e "During installation some config files can be ${B}overridden${N}, so make sure that you have a ${B}backup!${N}"
read -p "Do you want to install dotfiles? (Y/n) " -n 1 -r
echo -e "\n"

if [[ $REPLY =~ ^[Yy]$ ]]
then
    task_number=1
    # Executing tasks in a loop
    for task in $(list_tasks); do
        echo -n "($((task_number++))/$(count_tasks)) "
        ${task}
    done
    echo -e "\nDone!"
fi

