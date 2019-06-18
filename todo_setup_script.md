 - eiter get the script executable through github or chmod +x setupfile.sh

 - download setup-tools, git with apt

 - gitclone > ~/flic_setup

 - Disable blueman service 

 - move the executable ~/flic_setup/bin/flicd /usr/local/bin/flicd

     - (later/maybe) make and move simpleclient to /usr/local/bin/flicd

 - move the systemctl file to   /etc/systemd/system/flicd.service
```
[Unit]
Description=Flic Buttons Service
After=bluetooth.service

[Service]
Type=simple
User=%i
ExecStart=/usr/local/bin/flicd -w -s 0.0.0.0 -p 5551 -l /home/pi/flic/flic_log.txt -$
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target

``` 
(maybe there is an option to disable the bluetoothd service in this service file..)

 - systemctl enable flicd.service

 - systemctl start flicd.service

 - rm -r ~/flicd_setup

 - echo check status with `journalctl -u flicd -f` 
