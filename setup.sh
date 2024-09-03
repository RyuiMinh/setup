#!/bin/bash

# Update and upgrade the system
sudo apt update -qq && sudo apt upgrade -y -qq

# Check if add-apt-repository is available
if ! command -v add-apt-repository &> /dev/null
then
    echo "Installing software-properties-common..."
    sudo apt install -y software-properties-common -qq
fi

# Install Python 3.11
echo "Adding Python PPA..."
sudo add-apt-repository ppa:deadsnakes/ppa -y > /dev/null 2>&1
sudo apt update -qq
echo "Installing Python 3.11..."
sudo apt install -y python3.11 python3.11-venv python3.11-dev -qq

# Install Node.js
echo "Setting up Node.js repository..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - > /dev/null 2>&1
echo "Installing Node.js..."
sudo apt-get install -y nodejs -qq

# Install PHP
echo "Adding PHP PPA..."
sudo add-apt-repository ppa:ondrej/php -y > /dev/null 2>&1
sudo apt update -qq
echo "Installing PHP and related packages..."
sudo apt install -y php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-intl -qq

# Install JDK 21
echo "Installing OpenJDK 21..."
sudo apt install -y openjdk-21-jdk -qq

# Install additional packages
echo "Installing build-essential, curl, wget, git, and unzip..."
sudo apt install -y build-essential curl wget git unzip -qq

# Display installed package names
echo "Installed packages:"
echo "-----------------Python--------------"
python3.11 --version
echo "----------------Node.js--------------"
node --version
echo "------------------PHP--------------"
php --version
echo "--------------OpenJDK 21--------------"
java --version
echo "Build-essential, curl, wget, git, unzip"

echo " == !!!INSTALLATION COMPLETE!!! == "
