#!/bin/bash

REMINDER_BASHRC="
# this starts the reminder program on shell login
# this starts the reminder program on shell login
remind -z /home/enyo/.resources/scheduler/resources/daily.rem &
remind -z /home/enyo/.resources/scheduler/resources/oneTime.rem &
remind -z /home/enyo/.resources/scheduler/resources/periodic.rem &
"

# make directory for resources
if [ -d "resources" ]
then
    mkdir -p ~/.resources/scheduler/
    cp -r resources ~/.resources/scheduler/
fi

# copy over resources
mkdir -p $HOME/bin
cp -r main.sh $HOME/bin/scheduler

# add remind to .bashrc

read -p "Do you want to modify the .bashrc? (y/n): " modifyBashrc

if [ "$modifyBashrc" = "y" ]
then
    echo "$REMINDER_BASHRC" >> $HOME/.bashrc

else
    exit 0
fi
