#!/bin/bash

LOGFILE="../logs/drift.log"

echo "=============================="
echo "   AUTO HEALING SYSTEM"
echo "=============================="

for container in web1 web2
do
    if docker exec $container pgrep nginx > /dev/null 2>&1
    then
        echo "✔ $container already healthy"
    else
        echo "⚠ Drift detected on $container — nginx DOWN"
        echo "Healing $container..."

        docker exec $container nginx

        echo "✅ $container healed — nginx started"

        echo "$(date) $container AUTO HEALED" >> $LOGFILE
    fi

    echo ""
done

echo "=============================="
echo " Auto-heal completed"
echo "=============================="