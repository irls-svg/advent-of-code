#!/usr/bin/env bash

## Day 3: Rucksack Reorganisation

set -euo pipefail
IFS=$'\n\t'

get_priority() {
    local val="$1"
    local -i asc=0

    asc=$( printf "%d" "'$val" )

    if [[ $asc -ge 97 ]]; then
        echo "$((asc - 96))"
    elif [[ $asc -ge 65 ]]; then
        echo "$((asc - 38))"
    fi
}

part_one() {
    local -i sum=0
    local length match

    for i in ${input[@]}; do
        length=$(( ${#i} / 2 ))
        match=$(echo "${i:0:$length}" | grep -o ["${i:$length}"])
        sum+=$(get_priority $match)
    done

    echo "$sum"
}

part_two() {
    local -i pos=0 res=0

    while (( pos < 300 )); do
        local -a arr=()
        
        for (( j=pos; j < (pos + 3); j++ )); do
            arr+=("${input[j]}")
        done
        
        thing=$(echo "${arr[0]}" | grep -o ["${arr[1]}"] | grep -o ["${arr[2]}"])
        res+=$(get_priority $thing)

        pos=$((pos + 3))
    done

    echo "$res"
}

main() {
    input=( $(cat "$(dirname "$0")/input.txt") )
    echo "Part one: $(part_one)"
    echo "Part two: $(part_two)"
}

main