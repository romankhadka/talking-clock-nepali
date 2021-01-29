#!/bin/sh

speak_length='medium'

hour_12=$(date +"%I")

hour_24=$(date +"%H")

minute=$(date +"%M")

echo "playing"

base_path='./audio/'

bihana=$base_path'bihanako.ogg'


deusa=$base_path'deusako.ogg'


beluka=$base_path'belukako.ogg'


raati=$base_path'raatiko.ogg'

echo "Full hour is $full_hour"

function play_time_of_day
{
  if [ "$hour_24" -ge 0 ] && [ "$hour_24" -lt 12 ]

  #( $full_hour >= 00 && $full_hour < 12 )
  then
    play $bihana
  elif [ "$hour_24" -ge 12 ] && [ "$hour_24" -le 16 ]
  then
    play $deusa
  elif [ "$hour_24" -ge 17 ] && [ "$hour_24" -le 19 ]
  then
    play $beluka
  elif [ "$hour_24" -ge 20 ] && [ "$hour_24" -le 23 ]
  then
    play $raati
  fi
}

hr=$base_path"$hour_12.ogg"

hour_number=$base_path"numbers/$hour_12.ogg"
bajera=$base_path"bajera.ogg"
minute_number=$base_path"numbers/$minute.ogg"
minute_word=$base_path"minute.ogg"
gayo=$base_path"gayo.ogg"

echo $hr

function say_time 
{

  if [[ "$minute" == "00" ]]
  then

    if [[ "$speak_length" == "long" ]]
    then
      play_time_of_day
      play $hr
    else
      play $hr
    fi

  else
    if [[ "$speak_length" == "long" ]]
    then
        play_time_of_day
        play $hour_number
        play $bajera
        play $minute_number
        play $minute_word
        play $gayo
    elif [[ "$speak_length" == "medium" ]]
    then
        play_time_of_day
        play $hour_number
        play $minute_number
    elif [[ "$speak_length" == "short" ]]
    then
        play $hour_number
        play $minute_number
    fi

  fi

}

say_time

echo "played"