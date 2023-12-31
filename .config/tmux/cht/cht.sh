#!/bin/bash

FILE_PATH="./.config/tmux/cht"

selected=`cat ${FILE_PATH}/languages.txt ${FILE_PATH}/commands.txt | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

queryPrefix=""

if grep -qs $selected "${FILE_PATH}/languages.txt"; then
    query=`echo $query | tr ' ' '+'`
    queryPrefix="/"
else
    queryPrefix="~"
fi

tmux neww bash -c "curl -s cht.sh/$selected$queryPrefix$query | bat --paging=always"
