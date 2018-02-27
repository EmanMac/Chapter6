#!/bin/bash

echo "================"
echo "You can check the system's run leven by using who -r command. Your run level will probably be at 5 if you are running a GUI"

who -r
sleep 2s

echo "systemd tends to be the most common init system managment tool implemented on different flavors of linux, and you probably have it on your syste. IF this cd works you have this"

cd /etc/systemd

ls
sleep 2s

cd /usr/lib/systemd

ls
sleep 5s

echo "==================="
echo "systemctl list-units will show a list of current active units you have. You can start, stop, amongst other withs with commands like sudo systemctl start x, and the likes."
sleep 2s
systemctl list-units
sleep 5s

echo "We can narrow the search parameters as well by adding  things such as a tail of --type=service."
sleep 2s
systemctl list-units --type=service
sleep 5s

echo "We can check the current status of any service as well with the systemctl status x command"
sleep 2s
systemctl status cron.service
sleep 5s 

echo "this will show the current systemd configuration search path with a -p for precident. "
sleep 2s
sudo systemctl -p UnitPath show
sleep 5s

echo "and now a list of dependencies for the unit you search for, "
sleep 2s
sudo systemctl list-dependencies cron.service
sleep 5s

echo "==============="
echo "Finally this command  ids time critical startup unit with some info like the time a unit takes to start"

systemd-analyze critical-chain cron.service
sleep 3s

echo " I'm not going to troll you by throwing a shutdown into the script but if you want to run the command do  shutdown -h now"

