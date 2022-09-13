#!/bin/bash

# set the version of fluffy chat to use
VERSION="v1.6.4"

echo "Installing dependencies"

sudo apt-get update;
sudo apt-get install git -y;
sudo apt-get install curl -y;
sudo apt-get install cmake -y;
sudo apt-get install ninja-build -y;
sudo apt-get install clang -y;

sudo apt install libjsoncpp-dev libjsoncpp25 libsecret-1-dev libsecret-1-0 librhash0 libwebkit2gtk-4.0-dev libolm3 -y

echo "Make directory for development"
mkdir -p $HOME/development

echo "Cloning flutter"
git clone --depth 1 https://github.com/flutter/flutter.git $HOME/development/flutter;


cd $HOME/development/flutter \
&& git checkout stable;


export PATH=$PATH:$HOME/development/flutter/bin;

flutter;

echo "Downloading fluffy chat source code"

git clone --depth 1 -b $VERSION https://gitlab.com/famedly/fluffychat.git $HOME/development/fluffychat;


export PATH=$PATH:$HOME/development/flutter/bin ;

cd $HOME/development/fluffychat ;

echo "Building fluffy chat. go grab a cup of coffee, this will take a while..."

flutter build linux --release ;

echo "Done building fluffy chat, installing it to /opt/fluffychat"

sudo cp -r ./build/linux/arm64/release/bundle/. /opt/fluffychat

echo "Installing desktop icons" 

wget -O /home/mobian/.local/share/applications/fluffychat.png https://github.com/bigOconstant/pinephoneprofluffychat/raw/master/fluffychat.png

wget -O /home/mobian/.local/share/applications/fluffychat.desktop https://raw.githubusercontent.com/bigOconstant/pinephoneprofluffychat/master/fluffychat.desktop

echo "Done with installation, you may need to reboot to see the icon"