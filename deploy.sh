echo "Running CI/CD Test..."

# Run in background & save logs
nohup python3 app.py > app.log 2>&1 &

echo "Script execution completed."
