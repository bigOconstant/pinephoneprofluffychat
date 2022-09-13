# install fluffychat on the pinephone pro mobian


## Requirements
This requires mobian phosh on the pinephone pro for now. Other dependecies will be installed in the script. 

## instructions

copy `install_fluffychat.sh` to your home directory. You can download it with the following command. 

```
wget https://raw.githubusercontent.com/bigOconstant/pinephoneprofluffychat/master/install_fluffychat.sh
```
Then give it execution permissions,

```
chmod +x install_fluffychat.sh
```

and run it with `./install_fluffychat.sh`;


It will ask you for your password, default is `1234`;

It will take a while so sit back and drink some coffee.
Flutter itself takes the longest to build. fluffy chat is pretty quick.

At the end it reboots. It needs a reboot for everything to work properly.

Make sure you click `show all apps` to see your new fluffy chat icon

## further details

The script creates a directory called *development* in your home directory where it builds flutter and fluffychat. You can clear up space by deleting that directory.

## uninstalling

run the following three commands,

```
rm -rf /opt/fluffychat;
rm /home/mobian/.local/share/applications/fluffychat.png;
rm /home/mobian/.local/share/applications/fluffychat.desktop;
```