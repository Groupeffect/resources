apt update
apt dist-upgrade
apt-get install \
    git \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    terminator

# DOCKER
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker.io docker-compose-plugin -y


# PYTHON
# apt install python3.10-venv
# python3 -m venv proto
# pip install docker-compose

# CHROME
# cd ~/Downloads
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# dpkg -i google-chrome-stable_current_amd64.deb

# NODE NVM
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# JAVA
# apt install default-jre

# PRIVATE
# mkdir Projects

# UTILS
# apt install imagemagic
# apt install nautilus-image-converter
# apt install gimp inkscape blender qgis wmctrl
# apt install make
# apt install dh-autoreconf

