#!/bin/bash

# need to reconfigure to work for toml files.

hour=$(date +"%-H")
config_path="/home/bajra_sushant/.config/alacritty/alacritty.yml"

if [ "$1" == "--light" ]; then
	sed -i 's/^colors:.*/colors: \*SolarizedLight/' $config_path
	echo "Switched to light mode."
elif [ "$1" == "--dark" ]; then
	sed -i 's/^colors:.*/colors: \*Nord/' $config_path
	echo "Switched to dark mode."
else
	if [[ $hour -ge 6 && $hour -lt 18 ]]; then
		sed -i 's/^colors:.*/colors: \*SolarizedLight/' $config_path
		echo "Switched to light mode."
	else
		sed -i 's/^colors:.*/colors: \*Nord/' $config_path
		echo "Switched to dark mode."
	fi
fi
