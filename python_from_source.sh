# Old script; need to made dynamic; just backing up for now

#!/bin/sh
#
# Build Python Version 3.7.2 From Source

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
wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tar.xz
tar xf Python-3.7.2.tar.xz
cd Python-3.7.2

./configure --prefix=/usr/local/share/Python-3.7.2 --with-ensurepip=install --enable-optimizations

sudo make -j 8
sudo make altinstall

##  run python3.7 when you type python3
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.7 1
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
##  run below and select python3.7 from the list
# sudo update-alternatives --config python3

##  or symlink like this
sudo ln -s /usr/local/share/Python-3.7.2/bin/python3.7 /usr/local/bin/
sudo ln -s /usr/local/share/Python-3.7.2/bin/pip3.7 /usr/local/bin/

echo
echo "Python-3.7.2 symlinked as python3.7"
echo

