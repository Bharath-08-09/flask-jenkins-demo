#!/bin/bash

echo "Running Backend Setup..."

sudo apt update -y
sudo apt install python3.12-venv -y
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pkill -f "python3 app.py" || echo "No running Flask app found"
nohup venv/bin/python app.py > app.log 2>&1 &
