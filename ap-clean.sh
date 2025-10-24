#!/bin/bash

if [[ -n $AP_PLAYER && $AP_ROOM =~ ^(https?://archipelago.gg/room/)?([^/]+)$ ]]; then
    curl "${AP_ROOM_BASE:-https://archipelago.gg}/api/room_status/${BASH_REMATCH[2]}" -o /tmp/room
    mkdir /factorio/mods
    cd /factorio/mods
    if [[ -z $AP_NO_MANAGE_MOD ]]; then
        rm AP-*.zip
        SLOT="$(jq -r '.players | map(.[0] == "'"$AP_PLAYER"'") | index(true) + 1' /tmp/room)"
        curl -OJ "${AP_ROOM_BASE:-https://archipelago.gg}$(jq -r ".downloads[] | select(.slot == $SLOT) | .download" /tmp/room)"
    fi
    AP_URL="${AP_PROTOCOL:-wss}://$AP_PLAYER:$AP_PASSWORD@${AP_URL_BASE:-archipelago.gg:}$(jq -r '.last_port' /tmp/room)";
fi

if [[ -z $AP_URL ]]; then
    echo "Please specify either AP_URL or AP_ROOM." 1>&2
    exit 1
fi

echo "$AP_URL" > /tmp/url
