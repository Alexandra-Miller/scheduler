#!/bin/bash
: '
@project: scheduler
@repo: https://github.com/Alexandra-Miller/scheduler
@creator: Alexandra Marie Miller
@description
A simple scheduler system designed to remind me of what to do every day.

USAGE: scheduler OPTIONS
  OPTIONS:
  -d --daily      TIME    MSG     display MSG at TIME each day
  -o --one-time   DATE    MSG     display MSG at DATE
  -p --periodic   PERIOD  MSG     display MSG at the end of each PERIOD
  -l --list       GROUP           lists reminders in GROUP or all reminders
  -r --remove     ID              remove reminder by ID number

@description
@dependencies: remind, bash
'

# ====================  CONSTANTS  =============================================

HELPMSG="USAGE: scheduler OPTIONS
OPTIONS:
-d --daily      TIME    MSG     display MSG at TIME each day
-o --one-time   DATE    MSG     display MSG at DATE
-p --periodic   PERIOD  MSG     display MSG at the end of each PERIOD
-l --list       GROUP           lists reminders in GROUP or all reminders
-r --remove     ID              remove reminder by ID number
"

# ====================  FUNCTIONS  =============================================

: '
@function
  @name: oneTime
  @args: date, msg
  @sideEffects: modifies 
  @returns: none
  
@function
'
daily () {

}
: '
@function
  @name: oneTime
  @args: date, msg
  @sideEffects: modifies 
  @returns: none
  
@function
'
oneTime () {

}

: '
@function
  @name: periodic
  @args: date, msg
  @sideEffects: modifies 
  @returns: none
  
@function
'
periodic () {

}

: '
@function
  @name: list
  @args: date, msg
  @sideEffects: modifies 
  @returns: none
  
@function
'
list () {

}

: '

@function
  @name: remove
  @args: reminder id
  @sideEffects: modifies 
  @returns: none
  
@function
'
remove () {

}

if [ $# -eq 0 ]
then
    echo "$HELPMSG"

else
    [ "$1" = "-d" ] || [ "$1" = "--daily" ]

    [ "$1" = "-d" ] || [ "$1" = "--one-time" ]
    
    [ "$1" = "-p" ] || [ "$1" = "--periodic" ]

    [ "$1" = "-r" ] || [ "$1" = "--remove" ]
        
fi

