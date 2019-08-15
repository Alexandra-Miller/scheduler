# FILE NAME:  scheduler
### REPOSITORY:  https://github.com/Alexandra-Miller/scheduler
### CREATOR:  Alexandra Marie Miller
### DESCRIPTION:
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
###DEPENDENCIES: 
 remind, bash



## CLASSES:

## FUNCTIONS: 
### NAME:  oneTime
#### DESCRIPTION:
Converts argument to remind script and places it into the daily file.
  DEPENDENCIES: undefined
#### ARGUMENTS: 
 time, msg
#### SIDE EFFECTS:
 modifies daily file
#### RETURNS:
 none




### NAME:  oneTime
#### DESCRIPTION:
Converts argument to remind script and places it in the one time file.
  DEPENDENCIES: undefined
#### ARGUMENTS: 
 date, msg
#### SIDE EFFECTS:
 modifies one time file
#### RETURNS:
 none




### NAME:  periodic
#### DESCRIPTION:
Converts argument to remind script and places it into periodic file.
  DEPENDENCIES: undefined
#### ARGUMENTS: 
 time period, msg
#### SIDE EFFECTS:
 modifies periodic file
#### RETURNS:
 none




### NAME:  list
#### DESCRIPTION:
Lists reminders by category or lists all reminders
  DEPENDENCIES: undefined
#### ARGUMENTS: 
 reminder category or none
#### SIDE EFFECTS:
 sends listing of all reminders in category to STDOUT
#### RETURNS:
 none




### NAME:  remove
#### DESCRIPTION:

  DEPENDENCIES: undefined
#### ARGUMENTS: 
 reminder id number
#### SIDE EFFECTS:
 removes reminder from remind file by ID
#### RETURNS:
 none

