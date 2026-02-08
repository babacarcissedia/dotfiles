#!/bin/bash
# Play a random 5s segment of a Gibran Alcocer piece when Claude is idle
pkill -f "afplay.*/claude.*music" 2>/dev/null
rm -f /tmp/claude-piano-*.wav 2>/dev/null

MUSIC_DIR="$HOME/.claude/music"
FILES=("$MUSIC_DIR"/idea-*.mp3)

if [ ${#FILES[@]} -eq 0 ]; then
  exit 0
fi

# Pick a random song
RANDOM_FILE="${FILES[$RANDOM % ${#FILES[@]}]}"

# Get duration in seconds (integer)
DURATION=$(ffmpeg -i "$RANDOM_FILE" 2>&1 | grep Duration | sed 's/.*Duration: \([0-9]*\):\([0-9]*\):\([0-9]*\).*/\1*3600+\2*60+\3/' | bc)

# Pick a random start point (leave 3s room at the end)
MAX_START=$((DURATION - 3))
if [ "$MAX_START" -le 0 ]; then
  MAX_START=0
fi
START=$((RANDOM % (MAX_START + 1)))

# Extract 3s segment to temp file and play it
TEMP="/tmp/claude-piano-$$.wav"
ffmpeg -ss "$START" -t 3 -i "$RANDOM_FILE" -ar 44100 -ac 2 -f wav "$TEMP" -y -loglevel quiet 2>/dev/null

afplay -v 0.3 "$TEMP" &
