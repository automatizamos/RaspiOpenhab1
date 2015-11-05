#!/bin/bash
# Configuring OpenHab as a Service
sudo cp /opt/automatizamos/RaspiOpenhab1/scripts/openhab_init_d_template /etc/init.d/openhab
sudo chmod a+x /etc/init.d/openhab
sudo update-rc.d openhab defaults

# Deleting last row of rc.local "exit 0", and replacing the original file with the result
sudo head -n -1 /etc/rc.local > temp.txt ; mv temp.txt /etc/rc.local

# Adding the command to start openhab and putting back the row deleted from the previuos step
sudo echo '' >> /etc/rc.local
sudo echo '# start openhab' >> /etc/rc.local
sudo echo '/etc/init.d/openhab start' >> /etc/rc.local
sudo echo 'exit 0' >> /etc/rc.local
