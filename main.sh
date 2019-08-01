#!/bin/bash
: '
@filename: scheduler
@repository: https://github.com/Alexandra-Miller/scheduler
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
  @description
Converts argument to remind script and places it into the daily file.
  @description
  dDependencies
  @args: time, msg
  @sideEffects: modifies daily file
  @returnsi: none
  
@function
'
daily () {
    echo "test"
}
: '
@function
  @name: oneTime
  @description
Converts argument to remind script and places it in the one time file.
  @description
  @args: date, msg
  @sideEffects: modifies one time file
  @returns: none
  
@function
'
oneTime () {

}

: '
@function
  @name: periodic
  @description
Converts argument to remind script and places it into periodic file.
  @description
  @args: time period, msg
  @sideEffects: modifies periodic file
  @returns: none
  
@function
'
periodic () {

}

: '
@function
  @name: list
  @description
Lists reminders by category or lists all reminders
  @description
  @args: reminder category or none
  @sideEffects: sends listing of all reminders in category to STDOUT
  @returns: none
  
@function
'
list () {

}

: '

@function
  @name: remove
  @description

  @description
  @args: reminder id number
  @sideEffects: removes reminder from remind file by ID
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

