sudo apt install locales
# only use "en_US" if you are in the USA
# sudo locale-gen en_US en_US.UTF-8
sudo locale-gen es_MX es_MX.UTF-8

# if in the USA, select "en_US" locales.
sudo dpkg-reconfigure locales
# select your timezone
sudo dpkg-reconfigure tzdata