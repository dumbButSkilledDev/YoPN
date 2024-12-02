#!/bin/bash

echo "========= YOPN HOST SETUP ========="
echo "==> created and programmed by: connor walsh, (c) 2024"

sudo apt-get update
sudo apt-get install -y wget nginx

# setup reverse proxy
echo "==> setting up reverse proxy"

# we need to redirect google.com to our server
sudo cp res/stage2.conf /etc/nginx/sites-available/stage2.conf
sudo ln -s /etc/nginx/sites-available/stage2.conf /etc/nginx/sites-enabled/stage2.conf

echo "==> restarting nginx"
sudo systemctl restart nginx

echo "==> reverse proxy setup complete"

# install openvpn
echo "follow setup instructions to install openvpn, set dns to current system resolver!!"
wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh

echo "==> openvpn setup complete"
echo "==> setup complete"