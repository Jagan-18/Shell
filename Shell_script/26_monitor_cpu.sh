#### I.   write a shell script that monitors the CPU usage of a specific process.
#### II.  If the CPU usage exceeds a certain threshold, the script should terminate the process.
#### III. May be script need sudo access to execute while killing

#!/bin/bash

# Process name and CPU threshold
# The process_name variable holds the name of the process to monitor.
# The threshold is the CPU usage percentage above which the process will be terminated.
process_name="your_process_name_here" # Replace with the actual process name
threshold=50                          # Set the CPU usage threshold (in percentage)

# Finding the process
# The pgrep -f "$process_name" command is used to find all PIDs related to the given process name.
# The -f option tells pgrep to match against the full command line, not just the name of the process.
# If pgrep doesn't find any matching processes, the script exits with an error message.
pids=$(pgrep -f "$process_name")

# Check if the process is running
if [ -z "$pids" ]; then                       # If no PID is found, the process isn't running
    echo "Process '$process_name' not found." # Inform the user that the process is not found
    exit 1                                    # Exit the script with an error code
fi

# Loop through multiple processes
# If there are multiple instances of the process, the script will iterate over each PID returned by pgrep and check its CPU usage.
for pid in $pids; do # Loop through each PID found by pgrep
    # Get CPU usage
    # For each PID, the ps -p "$pid" -o %cpu= command retrieves the CPU usage of the process.
    # The awk command is used to extract the integer part of the percentage (int($1)).
    cpu_usage=$(ps -p "$pid" -o %cpu= | awk '{print int($1)}') # Extract the integer part of CPU usage

    echo "Current CPU usage of '$process_name' (PID $pid): $cpu_usage%" # Display current CPU usage

    # Comparing CPU usage with threshold
    # If the CPU usage exceeds the defined threshold, the script attempts to terminate the process using the kill command with sudo.
    # If the kill command is successful (exit status 0), it confirms that the process has been terminated.
    # If it fails, an error message is shown.
    if [ "$cpu_usage" -gt "$threshold" ]; then                                # If the CPU usage exceeds the threshold
        echo "CPU usage exceeds threshold. Terminating process (PID $pid)..." # Inform user about termination
        # Terminate the process (requires sudo if the process is owned by another user)
        sudo kill "$pid" # Terminate the process using sudo (necessary for processes owned by other users)

        if [ $? -eq 0 ]; then                     # Check if kill command was successful (exit status 0)
            echo "Process (PID $pid) terminated." # Confirm that the process was terminated successfully
        else
            echo "Failed to terminate process (PID $pid)." # Inform the user if kill failed
        fi
    else
        echo "CPU usage of process (PID $pid) is within threshold." # Inform user that CPU usage is within the acceptable range
    fi
done

# Termination confirmation
# The script provides feedback whether the process was successfully terminated or if it was within the acceptable CPU usage threshold.

## Explanation of the Comments:
#### 1. Process name and CPU threshold: Describes the purpose of the process_name and threshold variables.
#### 2. Finding the process: Explains how the pgrep command is used to find the PIDs of the process and how it works.
#### 3. Loop through multiple processes: Explains that if multiple PIDs are found, the script will iterate through them.
#### 4. Get CPU usage: Describes how the script retrieves and processes the CPU usage of the process.
#### 5. Comparing CPU usage with threshold: Explains how the script checks if the CPU usage exceeds the threshold and what happens when it does.
#### 6. Termination confirmation: Describes the final steps of the script, giving feedback to the user about the termination status.
