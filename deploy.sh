#!/bin/bash

echo "Running Backend Setup..."

sudo apt update -y
sudo apt install python3-pip -y

pip3 install --break-system-packages -r requirements.txt

export PATH=$PATH:/var/lib/jenkins/.local/bin
export PYTHONPATH=$PYTHONPATH:/var/lib/jenkins/.local/lib/python3.12/site-packages

pkill -f "python3 app.py" || echo "No running Flask app found"

# Start app directly in background with full path
python3 app.py > app.log 2>&1 & disown

# Wait a few seconds
sleep 5

# Now verify using Jenkins-compatible process listing
if pgrep -f "app.py" > /dev/null; then
    echo "✅ Flask app is running"
else
    echo "❌ Flask app failed to start. Dumping logs:"
    cat app.log
    exit 1
fi
