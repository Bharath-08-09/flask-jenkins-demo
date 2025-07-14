#!/bin/bash

echo "Running Backend Setup..."

sudo apt update -y
sudo apt install python3-pip -y

pip3 install --break-system-packages -r requirements.txt

pkill -f "python3 app.py" || echo "No running Flask app found"

nohup python3 app.py > app.log 2>&1 &
