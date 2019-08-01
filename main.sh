#!/bin/bash
: '
@filename: scheduler
@repository: https://github.com/Alexandra-Miller/scheduler
@creator: Alexandra Marie Miller
@description
A simple scheduler system designed to remind me of what to do every day.
```
USAGE: scheduler OPTIONS
  OPTIONS:
  -d --daily      TIME    MSG     display MSG at TIME each day
  -o --one-time   DATE    MSG     display MSG at DATE
  -p --periodic   PERIOD  MSG     display MSG at the end of each PERIOD
  -l --list       GROUP           lists reminders in GROUP or all reminders
  -r --remove     ID              remove reminder by ID number
```
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
RESOURCES_DIR="$HOME/.resources/scheduler/resources"
DAILY_REM_FILE="$RESOURCES_DIR/daily.rem"
ONETIME_REM_FILE="$RESOURCES_DIR/oneTime.rem"
PERIODIC_REM_FILE="$RESOURCES_DIR/periodic.rem"

source $RESOURCES_DIR/var

# ====================  FUNCTIONS  =============================================

: '
@function
  @name: oneTime
  @description
Converts argument to remind script and places it into the daily file.
  @description
  @ependencies: none
  @args: time, msg
  @sideEffects: modifies daily file
  @returns: none
  
@function
'
daily () {
    time=$1
    shift
    msg=$@
    ID_NUM=`expr $ID_NUM + 1`
    echo "# $ID_NUM" >> $DAILY_REM_FILE
    echo -e "REM AT $time MSG $msg\n" >> $DAILY_REM_FILE
}
: '
@function
  @name: oneTime
  @description
Converts argument to remind script and places it in the one time file.
  @description
  @ependencies: none
  @args: date, msg
  @sideEffects: modifies one time file
  @returns: none
  
@function
'
oneTime () {
    date=$1
    shift
    msg=$@
    ID_NUM=`expr $ID_NUM + 1`
    echo "# $ID_NUM" >> $ONETIME_REM_FILE
    echo "REM ONCE $date MSG $msg" >> $ONETIME_REM_FILE
    echo "REM ONCE $date RUN sed \"/x$idNum/,+2d\" $ONETIME_REM_FILE" >> $ONETIME_REM_FILE
}

: '
@function
  @name: periodic
  @description
Converts argument to remind script and places it into periodic file.
  @description
  @ependencies: none
  @args: time period, msg
  @sideEffects: modifies periodic file
  @returns: none
  
@function
'
periodic () {
    period=$1
    shift
    msg=$@
    ID_NUM=`expr $ID_NUM + 1`
    echo "# $ID_NUM" >> $PERIODIC_REM_FILE
    echo -e "REM AT $period MSG $msg\n" >> $PERIODIC_REM_FILE
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
    if [ "$1" = "daily" ]
    then
        cat $DAILY_REM_FILE
    elif [ "$1" = "onetime" ]
    then
        cat $ONETIME_REM_FILE
    elif [ "$1" = "periodic" ]
    then
        cat $PERIODIC_REM_FILE

    else
        echo "DAILY REMINDERS:"
        cat $DAILY_REM_FILE 
        echo "ONETIME REMINDERS:"
        cat $ONETIME_REM_FILE 
        echo "PERIODIC REMINDERS:"
        cat $PERIODIC_REM_FILE
    fi

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
    targetID=$1
    sed "/x$targetID/,+1d" $ONETIME_REM_FILE $DAILY_REM_FILE $PERIODIC_REM_FILE
}




if [ $# -eq 0 ]
then
    echo "$HELPMSG"

else
    [ "$1" = "-d" ] || [ "$1" = "--daily" ] && shift && daily $@

    [ "$1" = "-o" ] || [ "$1" = "--one-time" ] && shift && oneTime $@
    
    [ "$1" = "-p" ] || [ "$1" = "--periodic" ] && shift && periodic $@

    [ "$1" = "-l" ] || [ "$1" = "--list" ] && list $2

    [ "$1" = "-r" ] || [ "$1" = "--remove" ] && remove $2

fi

# update var file
echo "ID_NUM=\"$ID_NUM\"" > $RESOURCES_DIR/var

