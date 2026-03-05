#!/bin/bash

LOGFILE="../logs/drift.log"

echo "=============================="
echo "   GHOST DRIFT DETECTION"
echo "=============================="

for container in web1 web2
do
    echo "Checking $container..."

    if docker exec $container pgrep nginx > /dev/null 2>&1
    then
        echo "$container healthy ✅"
        echo "$(date) $container healthy" >> $LOGFILE
    else
        echo "$container DRIFT DETECTED ❌ (nginx stopped)"
        echo "$(date) $container DRIFT DETECTED" >> $LOGFILE
    fi

    echo ""
done

echo "=============================="
echo " Drift check completed"
echo "=============================="