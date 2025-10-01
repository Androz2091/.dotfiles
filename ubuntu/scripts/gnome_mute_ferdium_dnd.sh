#!/bin/bash

# Ferdium is an app that aggregates all social services
# it is nice to disable all sounds coming from Ferdium while DND is active in the gnome environment

get_ferdium_stream_id() {
    pactl list sink-inputs | awk '/Sink Input/ {sink=$3} /pipewire.access.portal.app_id = "org.ferdium.Ferdium"/ {gsub("#", "", sink); print sink}'
}

set_ferdium_mute() {
    local mute_state=$1
    local stream_id=$(get_ferdium_stream_id)

    if [ -z "$stream_id" ]; then
	 echo "⚠️  No stream found for Ferdium!"
        return 1
    fi

    echo "🎛  Updating sound settings for Ferdium (ID: $stream_id)..."
    pactl set-sink-input-mute "$stream_id" "$mute_state"
}

DND_STATE=$(gsettings get org.gnome.desktop.notifications show-banners)

echo "ℹ️  DND mode : $DND_STATE"

if [ "$DND_STATE" == "false" ]; then
    echo "🔇 DND enabled -> Mute Ferdium"
    set_ferdium_mute 1
else
    echo "🔇 DND enabled -> Mute Ferdium"
    set_ferdium_mute 0
fi
