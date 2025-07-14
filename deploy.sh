#!/bin/bash

echo "Running Backend Setup..."

sudo apt update -y
sudo apt install python3-pip -y

pip3 install --break-system-packages -r requirements.txt

# Set Python path for Jenkins-installed packages
export PATH=$PATH:/var/lib/jenkins/.local/bin
export PYTHONPATH=$PYTHONPATH:/var/lib/jenkins/.local/lib/python3.12/site-packages

pkill -f "python3 app.py" || echo "No running Flask app found"

# Start Flask app and log output
nohup python3 app.py > app.log 2>&1 &
