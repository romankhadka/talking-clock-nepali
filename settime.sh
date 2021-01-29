#!/bin/bash

speak_length="long"
speak_preference="once"
crontab='which crontab'


ask_for_option() {

    read -p "What do you like to do? 
    1 - say current time
    2 - set to speak time once evey hour
    3 - set to speak time once every 30 min
    4 - set to speak time once every 15 min
    " answer

    # echo (( "$answer" == 1 ))
    if [ $answer -eq 1 ]
    then
        sh ./currenttime.sh
    elif [ $answer -eq 2 ]
    then
        speak_preference="once"
        length_query


    elif [ $answer -eq 3 ]
    then
        speak_preference="twice"
        length_query

    elif [ $answer -eq 4 ]
    then
        speak_preference="quad"
        length_query

    else
        echo "choose among given options"
    fi

}

length_query()
{

    read -p "What do you like to do? 
    1 - set speaking words to long (bihana ko 10 bajera 14 minute gayo / bihana ko 10 bajyo)
    2 - set speaking words to medium (bihana ko 10 14 / bihana ko 10 bajyo)
    3 - set speaking words to short (10 14 / 10 bajyo)
    " answer
    
    if [ $answer -eq 2 ]
    then
      speak_length="medium"
    elif [ $answer -eq 3 ]
    then
      speak_length="short"

    else
        echo "choose among given options"
    fi
    set_time

}

declare -A preference_values

repition_values+=( ["once"]="0 */1 * * * " ["twice"]="*/30 * * * * ",  ["quad"]="*/15 * * * * " )


script_path="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cron_path=`which crontab`

echo "playing"
echo "script path"$script_path
echo "cron path"$cron_path

set_time()
{

    if [ "$speak_preference" == "once" ]
    then
        # echo $speak_preference
        # echo ${repition_values[${speak_preference}]}
        # replacement_line="0 */1 "*" "*" "*" "$script_path"/saytime.sh"
        replacement_line='0 */1 * * * '$script_path'/saytime.sh'
        echo "once"


    elif [ "$speak_preference" == "twice" ]
    then
        # echo $speak_preference
        # echo ${repition_values[${speak_preference}]}
        # replacement_line="*/30 "*" "*" "*" "*" "$script_path
        replacement_line='*/30 * * * * '$script_path'/saytime.sh'
        echo "thrice"



    elif [ "$speak_preference" == "quad" ]
    then
        # echo $speak_preference
        # echo ${repition_values[${speak_preference}]}
        # replacement_line="*/15 "*" "*" "*" "*" "$script_path
        replacement_line='*/15 * * * * '$script_path'/saytime.sh'
        echo "quad"


    fi

    crontab -l | sed "/.*saytime.sh$/$replacement_line/" | crontab -
    echo "replacement line in crontab is ""$replacement_line"

}

set_speak_preference() 
{
    
    replacement_str="speak_length='"$speak_length"'"
    sed -i "s/speak_length=.*/$replacement_str/" saytime.sh

}

ask_for_option
set_speak_preference