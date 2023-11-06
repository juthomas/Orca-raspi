#!/bin/sh

# Define the user's home directory and username
USER_HOME="$HOME"

# Prepare sources
cd "$USER_HOME/Documents" || exit
sudo apt-get update
sudo apt-get install -y npm
git clone https://github.com/juthomas/Orca-raspi.git
cd "$USER_HOME/Documents/Orca-raspi/desktop" || exit

# Set Wallpaper
pcmanfm --set-wallpaper="$USER_HOME/Documents/Orca-raspi/NSDOS-DDOS-NIAKABI-Wallpaper.png"
pcmanfm --wallpaper-mode=screen

# Install
npm install

# Create autostart on Raspi
echo "[Desktop Entry]
Name=Orca Raspi
Comment=ORCA Modified for DDOS
Icon=$USER_HOME/Documents/Orca-raspi/desktop/icon.svg
Exec=lxterminal -t \"Orca\" --working-directory=$USER_HOME/Documents/Orca-raspi/desktop -e \"npm start\"
Type=Application
Encoding=UTF-8
Terminal=false
Categories=None" | sudo tee /etc/xdg/autostart/orca.desktop > /dev/null

# Create Shortcut on desktop
echo "[Desktop Entry]
Name=Orca Raspi
Comment=ORCA Modified for DDOS
Icon=$USER_HOME/Documents/Orca-raspi/desktop/icon.svg
Exec=lxterminal -t \"Orca\" --working-directory=$USER_HOME/Documents/Orca-raspi/desktop -e \"npm start\"
Type=Application
Encoding=UTF-8
Terminal=false
Categories=None" | sudo tee $USER_HOME/Desktop/orca.desktop > /dev/null

# Create Shortcut for update on desktop
echo "[Desktop Entry]
Name=Orca Raspi Updater
Comment=Update ORCA Modified for DDOS
Icon=$USER_HOME/Documents/Orca-raspi/desktop/icon.svg
Exec=lxterminal -t \"Orca\" --working-directory=$USER_HOME/Documents/Orca-raspi/desktop -e \"git pull; sleep 3\"
Type=Application
Encoding=UTF-8
Terminal=false
Categories=None" | sudo tee $USER_HOME/Desktop/orca.desktop > /dev/null


# Start the program
npm start
