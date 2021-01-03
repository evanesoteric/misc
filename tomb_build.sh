# TODO: make dynamic

#!/bin/bash
#
# Tomb [https://files.dyne.org/tomb/]

echo
echo "Installing Tomb."
echo

if ((EUID != 0)); then
  echo >&2 "Error: script not running as root or with sudo! Exiting..."
  exit 1
fi

sudo apt update
sudo apt -y install zsh \
sudo \
gnupg \
cryptsetup \
pinentry-curses

cd /tmp

wget https://files.dyne.org/tomb/Tomb-2.5.tar.gz
tar -xzf Tomb-2.5.tar.gz
sudo rm Tomb-2.5.tar.gz
cd Tomb-2.5

sudo make install

mv -f extras/gtomb/gtomb /home/some_user/foo/bar/

rm -rf /tmp/Tomb-2.5
