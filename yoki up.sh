#!/bin/bash

# Check if the script is run with root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

# Update the package manager
echo "Updating packages..."
apt update   # Replace with your package manager's command if not using APT

# Upgrade all installed packages
echo "Upgrading packages..."
apt list --upgradable | awk -F/ '/\// {print $1}' | xargs apt install -y   # Replace with your package manager's command if not using APT

# Optional: Clean up unused packages and dependencies
echo "Performing cleanup..."
apt autoremove -y   # Replace with your package manager's command if not using APT

echo "Update complete."
