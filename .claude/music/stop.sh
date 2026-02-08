#!/bin/bash
# Stop any playing Gibran Alcocer music and clean up
pkill -f "afplay.*/claude.*piano" 2>/dev/null
rm -f /tmp/claude-piano-*.wav 2>/dev/null
exit 0
