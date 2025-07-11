echo "Running Backend Setup..."

sudo apt update
sudo apt install python3-pip -y
pip3 install -r requirements.txt

# Kill existing Flask app if running
pkill -f "python3 app.py"

# Run Flask app in background
nohup python3 app.py > app.log 2>&1 &
