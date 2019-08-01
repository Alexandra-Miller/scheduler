#!/bin/bash

REMINDER_BASHRC="
# this starts the reminder program on shell login
remind -j $HOME/.resources/scheduler/oneTime.rem
remind -z $HOME/.resources/scheduler/master.rem
"

# make directory for resources
if [ -d "resources" ]
then
    mkdir -p ~/.resources/scheduler/
    mv resources ~/.resources/scheduler/
fi

# copy over resources
mkdir -p $HOME/bin
mv main.sh $HOME/bin/scheduler

# add remind to .bashrc

read -p "Do you want to modify the .bashrc? (y/n): " modifyBashrc

if [ "$modifyBashrc" = "y" ]
then
    echo "$REMINDER_BASHRC" >> $HOME/.bashrc

else
    exit 0
fi
