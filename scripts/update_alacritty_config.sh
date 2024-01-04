#!/bin/bash

hour=$(date +"%-H")
config_path="/home/bajra_sushant/.config/alacritty/alacritty.toml"

light="catppuccin_latte"
dark="catppuccin_frappe"

if [ "$1" == "--light" ]; then
	sed -i "s/$dark/$light/g" $config_path
	echo "Switched to light mode."
elif [ "$1" == "--dark" ]; then
	sed -i "s/$light/$dark/g" $config_path
	echo "Switched to dark mode."
else
	if [[ $hour -ge 6 && $hour -lt 18 ]]; then
		sed -i "s/$dark/$light/g" $config_path
		echo "Switched to light mode."
	else
		sed -i "s/$light/$dark/g" $config_path
		echo "Switched to dark mode."
	fi
fi
