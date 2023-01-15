sudo apt install git vim tmux libx11-dev libxtst-dev make gcc
cd
git clone https://github.com/aleh/pocketchip-batt.git
cd pocketchip-batt
sudo make install
cd
git clone --bare https://git.nytpu.com/personal/dotfiles ~/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mkdir -p .config-backup && config checkout pocketchip 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
config checkout pocketchip
rm -r .config-backup/
config config --local status.showUntrackedFiles no

echo 'export SDL_GAMECONTROLLERCONFIG="030000001008000001e5000010010000,usb gamepad,platform:Linux,a:b2,b:b1,x:b3,y:b0,back:b8,start:b9,leftshoulder:b4,rightshoulder:b6,dpup:-a1,dpdown:+a1,dpleft:-a0,dpright:+a0,"' | sudo tee /etc/environment