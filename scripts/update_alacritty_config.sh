#!/bin/bash

hour=$(date +"%-H")
config_path="/home/bajra_sushant/.config/alacritty/alacritty.yml"

if [[ $hour -ge 6 && $hour -lt 18 ]]; then
	sed -i 's/^colors:.*/colors: \*SolarizedLight/' $config_path
else
	sed -i 's/^colors:.*/colors: \*Nord/' $config_path
fi
