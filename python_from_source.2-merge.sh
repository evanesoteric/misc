#!/bin/sh
#
# TODO: force 3.7 @ /usr/bin
#
# Build Python Version 3.7.4 From Source

# Require sudo
if ((EUID != 0)); then
  echo >&2 "Error: script not running as root or with sudo! Exiting..."
  exit 1
fi

apt update
apt full-upgrade

apt install build-essential \
libssl-dev \
zlib1g-dev \
libncurses5-dev \
libncursesw5-dev \
libreadline-dev \
libsqlite3-dev \
libgdbm-dev \
libdb5.3-dev \
libbz2-dev \
libexpat1-dev \
liblzma-dev \
tk-dev \
libffi-dev

cd /tmp
wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz
tar xf Python-3.7.4.tar.xz
cd Python-3.7.4

./configure --prefix=/usr/local/share/Python-3.7.4 --with-ensurepip=install --enable-optimizations

sudo make -j 6
sudo make altinstall

sudo ln -s /usr/local/share/Python-3.7.4/bin/python3.7 /usr/local/bin/
sudo ln -s /usr/local/share/Python-3.7.4/bin/pip3.7 /usr/local/bin/

# If built from source (check first)
echo "/usr/bin/fish" | tee -a /etc/shells

echo "# add aliases to shell (bash/fish):"
echo 'alias python="python3.7"'
echo 'alias pip="python3.7 -m pip"'

echo
echo
echo "Python-3.7.4 Install!"
