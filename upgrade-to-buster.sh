#!/bin/bash

# Check if user is root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

ACTUALDIR=`dirname $0`
SOURCESLISTFILE=`/etc/apt/sources.list`
BUSTERDIR=`$ACTUALDIR/buster`
XORGDIR=`/etc/X11/xorg.conf`

mv $SOURCESLISTFILE $SOURCESLISTFILE.jessie.bk
cp $BUSTERDIR/source.list $SOURCESLISTFILE

apt update && sudo apt full-upgrade

cp $BUSTERDIR/xorg.conf $XORGDIR