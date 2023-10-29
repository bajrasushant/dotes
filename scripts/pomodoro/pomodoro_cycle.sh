#!/bin/bash

declare -A pomo_options

pomo_options["work"]="50"
pomo_options["break"]="10"

SOUND_DIR=~/scripts/pomodoro/sounds
SOUND_FILE=bowl_sound.wav

cleanup() {
	echo "Cleaning up..."
	rm -f /tmp/pomodoro_cycle
	rm -f /tmp/pomodoro_time
	exit
}

trap cleanup EXIT SIGINT SIGTERM

play_sound() {
	mpv --really-quiet --no-video --start=0 --end=3 "$SOUND_DIR/$SOUND_FILE" &
}

custom_timer() {
	local minutes=$1
	local seconds=0

	while [ $minutes -gt 0 ] || [ $seconds -gt 0 ]; do
		echo -ne "Remaining Time: $minutes minutes $seconds seconds\033[0K\r"
		echo "$minutes:$seconds" > /tmp/pomodoro_time
		sleep 1
		if [ $seconds -eq 0 ]; then
			((minutes--))
			seconds=59
		else
			((seconds--))
		fi
	done
}

pomodoro() {
	if [ -n "$1" -a -n "${pomo_options[$1]}" ]; then
		notify-send "Pomodoro" "Starting $1 cycle"
		play_sound
		val=$1
		if [ ! -e /tmp/pomodoro_cycle ]; then
			touch /tmp/pomodoro_cycle
		fi
		if [ ! -e /tmp/pomodoro_time ]; then
			touch /tmp/pomodoro_time
		fi
		echo ${val^} | lolcat 
		echo ${val^} > /tmp/pomodoro_cycle
		custom_timer ${pomo_options[$val]} 
		rm -f /tmp/pomodoro_cycle
		rm -f /tmp/pomodoro_time
	fi
}

pomo_cycle() {
	local num_cycles=${1:-1}
	if [ "$(cat /tmp/pomodoro_cycle 2> /dev/null)" == "Work" ] || [ "$(cat /tmp/pomodoro_cycle 2> /dev/null)" = "Break" ]; then
		echo "Pomodoro cycle already running"
	else for ((i=0; i<$num_cycles; i++)); do
		pomodoro "work"
		pomodoro "break"
	done
	notify-send "Pomodoro" "Pomodoro cycle done"
	fi
}

pomo_cycle "$@"
