#!/bin/bash

echo "=============================="
echo "   GHOST DRIFT DEMO START"
echo "=============================="

echo ""
echo "▶ Starting nginx on both containers..."
docker exec web1 nginx >/dev/null 2>&1
docker exec web2 nginx >/dev/null 2>&1
sleep 2

echo ""
echo "▶ Creating configuration drift (breaking web1)..."
docker exec web1 pkill -9 nginx
sleep 2

echo ""
echo "▶ Running drift detection..."
./detect_drift.sh
sleep 2

echo ""
echo "▶ Running auto-heal..."
./autoheal.sh
sleep 2

echo ""
echo "▶ Final verification..."
./detect_drift.sh

echo ""
echo "=============================="
echo "   DEMO COMPLETED"
echo "=============================="
