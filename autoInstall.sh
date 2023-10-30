#!/bin/sh

# Define the user's home directory and username
USER_HOME="$HOME"

# Install on raspberry-pi
cd "$USER_HOME/Documents" || exit
sudo apt-get update
sudo apt-get install -y npm
git clone https://github.com/juthomas/Orca-raspi.git
echo "$USER_HOME/Documents/Orca-raspi/desktop" 
cd "$USER_HOME/Documents/Orca-raspi/desktop" || exit
echo "$PWD"
npm install

# Create autostart on Raspi
echo "[Desktop Entry]
Name=ORCA
Comment=ORCA Modified via npm
Exec=lxterminal -t \"Orca\" --working-directory=$USER_HOME/Documents/Orca-raspi/desktop -e \"npm start\"
Type=Application
Encoding=UTF-8
Terminal=false
Categories=None" | sudo tee /etc/xdg/autostart/orca.desktop > /dev/null

# Set Wallpaper
pcmanfm --set-wallpaper="$USER_HOME/Documents/Orca-raspi/NSDOS-DDOS-NIAKABI-Wallpaper.png"

# Start the program
npm start
