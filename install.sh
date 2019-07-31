#!/bin/bash


#make directory for resources
if [ -d "resources" ]
then
    mkdir -p ~/.resources/scheduler/
    mv resources ~/.resources/scheduler/
fi

mkdir -p $HOME/bin
mv main.sh $HOME/bin/scheduler
