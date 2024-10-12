#!/bin/bash

# Function to detect operating system
detect_os() {
    OS="Unknown"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [[ -f /etc/os-release ]]; then
            # Linux distribution (Debian, Ubuntu, Fedora, CentOS, etc.)
            . /etc/os-release
            OS=$NAME
        else
            OS=$(uname -o)
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="MacOS"
    elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        OS="Windows"
    else
        OS=$(uname -s)
    fi

    echo "$OS"
}

# Get the public IP address
get_public_ip() {
    IP=$(curl -s https://api.ipify.org)
    echo "$IP"
}

# Get current date and time
get_date_time() {
    DATE_TIME=$(date)
    echo "$DATE_TIME"
}

# Main logic
echo "Detecting Operating System..."
OS=$(detect_os)
echo "OS: $OS"

echo "Fetching Public IP..."
IP=$(get_public_ip)
echo "Public IP: $IP"

echo "Getting Current Date and Time..."
DATE_TIME=$(get_date_time)
echo "Date/Time: $DATE_TIME"

# Reporting the information
echo -e "\nReport:"
echo "Operating System: $OS"
echo "Public IP Address: $IP"
echo "Current Date/Time: $DATE_TIME"
