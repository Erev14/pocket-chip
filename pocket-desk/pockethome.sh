echo "deb https://o-marshmallow.github.io/PocketCHIP-pocket-home/archive/ jessie main" | sudo tee /etc/apt/sources.list.d/marshmallow-pocket-chip-home.list
echo -e "Package: pocket-home\nPin: version *\nPin-Priority: 1050" | sudo tee /etc/apt/preferences.d/unpin-pocket-home.pref
apt-get update
apt-get install pocket-home
mkdir /home/chip/.pocket-home/
wget -O /home/chip/.pocket-home/config.json https://raw.githubusercontent.com/AllGray/PocketDesk/master/files/config.json
sudo chown -R chip: .pocket-home/