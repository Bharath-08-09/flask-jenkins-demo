\import time

print("✅ CI/CD pipeline executed successfully!")
with open("output.txt", "w") as f:
    f.write("Hello from Jenkins CI/CD!\n")
    f.write("This file was created by app.py\n")

# Simulate long-running job
time.sleep(10)
print("Code updated and testing the webhook")
