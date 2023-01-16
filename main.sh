#!/bin/bash

# Check if user is root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

ACTUALDIR=`dirname $0`
POCKETDESKDIR=`$ACTUALDIR/pocket-desck`
SOURCESLISTFILE=`/etc/apt/sources.list`
PREFERENCESFILE=`/etc/apt/preferences`
JESSIEDIR=`$ACTUALDIR/jessie`
STRETCHDIR=`$ACTUALDIR/stretch`
BUSTERDIR=`$ACTUALDIR/buster`
NETWORKMANAGERDIR=`/etc/NetworkManager/NetworkManager.conf`
XORGDIR=`/etc/X11/xorg.conf`

reset

$POCKETDESKDIR/greeting.sh

# set up jessie source list
mv $SOURCESLISTFILE $SOURCESLISTFILE.bk

cp $JESSIEDIR/sources.list $SOURCESLISTFILE

apt update && sudo apt upgrade

# update preferences
mv $PREFERENCESFILE $PREFERENCESFILE.bk

cp $JESSIEDIR/preferences $PREFERENCESFILE

sudo apt update && sudo apt upgrade

apt install openssh-server x11vnc
x11vnc -storepasswd
nohup x11vnc -forever -nevershared -rfbauth ~/.vnc/passwd &

wget www.lexaloffle.com/dl/chip/pico-8_0.2.5c_chip.zip
sudo unzip pico-8_0.2.5c_chip.zip -d /usr/lib

systemctl start ssh
systemctl enable ssh

# set up Stretch source list
cp $STRETCHDIR/sources.list $SOURCESLISTFILE

sudo apt update && sudo apt full-upgrade
cp $STRETCHDIR/NetworkManager.conf $NETWORKMANAGERDIR
cp $STRETCHDIR/xorg.conf $XORGDIR

# set up Buster source list