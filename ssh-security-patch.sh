sudo sed -i 's/.*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
# only run this if you have ssh keys set up
# sudo sed -i 's/.*PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# lock the root account from direct login
sudo passwd -l root
# change the CHIP's password
passwd

# make sure to confirm upgrading unverified packages
sudo apt update && sudo apt full-upgrade -y --force-yes
# the apt version is too old to use apt autoremove so we use apt-get
sudo apt-get autoremove --purge
sudo apt-get clean