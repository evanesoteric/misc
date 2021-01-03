# make dyamic when have time and care :P


#!/bin/bash
#
# Build Fish Shell from source

# Delete old fish version
rm -rf ~/.local/share/fish
rm -rf ~/.local/share/omf
rm -rf ~/.config/fish
rm -rf ~/.config/omf

# Move to install parent dir
cd ~/.local/share

# Pull source code
wget https://github.com/fish-shell/fish-shell/releases/download/3.0.2/fish-3.0.2.tar.gz

# Install
tar xzf fish-3.0.2.tar.gz
cd fish-3.0.2
./configure
make
sudo make install

# Add fish shell to /etc/shells
echo /usr/local/bin/fish | sudo tee -a /etc/shells

# make fish the default shell
chsh -s /usr/local/bin/fish

# Install oh-my-fish
curl -L https://get.oh-my.fish | fish

# Change fish theme
omf install edan

# logout -> login
echo "Logout and Login or Reboot"
