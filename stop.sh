#!/bin/bash

echo "Stopping Ghost Drift Environment..."

docker rm -f web1 web2

echo "Environment stopped"