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

reset

$POCKETDESKDIR/greetings.sh

# set up jessie source list
mv $SOURCESLISTFILE $SOURCESLISTFILE.bk

cp $JESSIEDIR/sources.list $SOURCESLISTFILE

apt update && sudo apt upgrade

# update preferences
mv $PREFERENCESFILE $PREFERENCESFILE.bk

cp $JESSIEDIR/preferences $PREFERENCESFILE

apt install openssh-server x11vnc

systemctl start ssh
systemctl enable ssh

# set up Stretch source list

# set up Buster source list



x11vnc -storepasswd
nohup x11vnc -forever -nevershared -rfbauth ~/.vnc/passwd &

wget www.lexaloffle.com/dl/chip/pico-8_0.2.5c_chip.zip
sudo unzip pico-8_0.2.5c_chip.zip -d /usr/lib