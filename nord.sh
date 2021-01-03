# make useful and rationalize if ever care

#!/bin/bash
#
# NordVPN
# https://nordvpn.com/tutorials/linux/openvpn/
# https://nordvpn.com/servers/#recommended

echo
echo "Install OpenVPN and pull NordVPN servers."
echo

if ((EUID != 0)); then
  echo >&2 "Error: script not running as root or with sudo! Exiting..."
  exit 1
fi

sudo apt update
sudo apt -y install ca-certificates \
openvpn

cd /etc/openvpn

sudo wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip

sudo unzip ovpn.zip
sudo rm ovpn.zip


## Usage
#
#  openvpn us842.nordvpn.com.udp.ovpn
#  openvpn /etc/openvpn/ovpn_udp/us842.nordvpn.com.udp.ovpn
#
# Disconnect w/ Ctrl + C


## Use network-manager on supported systems
#
# sudo apt install network-manager-openvpn-gnome
