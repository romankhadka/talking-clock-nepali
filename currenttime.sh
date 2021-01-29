#!/bin/sh

hour_12=$(date +"%I")

hour_24=$(date +"%H")

minute=$(date +"%M")

base_path='./audio/'

bihana=$base_path'bihanako.ogg'


deusa=$base_path'deusako.ogg'


beluka=$base_path'belukako.ogg'


raati=$base_path'raatiko.ogg'

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



if [[ "$minute" == "00" ]]
then
play_time_of_day
play $hr

else
    play_time_of_day
    play $hour_number
    play $bajera
    play $minute_number
    play $minute_word
    play $gayo
fi