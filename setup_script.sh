#!/bin/sh

mkdir /home/pi/flic/
#binary

echo "Downloading  armv6l/flicd "
curl https://raw.githubusercontent.com/50ButtonsEach/fliclib-linux-hci/master/bin/armv6l/flicd > /usr/local/bin/flicd
chmod a+x /usr/local/bin/flicd

echo "Downloading  systemd file and make it executable "
curl https://raw.githubusercontent.com/Underknowledge/fliclib-linux-hci/master/systemd/flicd.service > /etc/systemd/system/flicd.service
chmod a+x /etc/systemd/system/flicd.service

echo "Disableing Bluetooth" 
sudo systemctl stop bluetooth
sudo systemctl disable bluetooth

echo " enableing the new flicd.service" 
sudo systemctl enable flicd.service
sudo systemctl start flicd.service

echo " Done " 
echo " check for errors with 'journalctl -u flicd -f' "
