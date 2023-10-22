#!/bin/bash

get_pomodoro_status() {
    if [ -f /tmp/pomodoro_cycle ] && [ -f /tmp/pomodoro_time ]; then
        cycle_type=$(cat /tmp/pomodoro_cycle)
        remaining_time=$(cat /tmp/pomodoro_time)
        case $cycle_type in
            "Work")
                echo " $cycle_type: $remaining_time"
                ;;
            "Break")
                echo " $cycle_type: $remaining_time"
                ;;
        esac
    else
        echo " Leisure"
    fi
}
get_pomodoro_status
