#!/bin/bash

echo "=============================="
echo "   GHOST DRIFT MONITOR"
echo "=============================="

while true
do
    echo ""
    echo "Time: $(date)"
    echo ""

    output=$(./detect_drift.sh)

    echo "$output"

    if echo "$output" | grep -q "DRIFT DETECTED"
    then
        echo ""
        echo "⚠ Drift detected! Triggering Auto-Heal..."
        ./autoheal.sh
    fi

    sleep 5
done