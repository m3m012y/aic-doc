for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install the Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl status docker
sudo systemctl start docker

# Optional post-installation procedures
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Install git
sudo apt-get update
sudo apt-get install git

# Optional orange pi build jammy server to install mali driver
sudo apt install ocl-icd-opencl-dev libx11-xcb1 libxcb-dri2-0
sudo apt autoremove

wget https://launchpad.net/~jjriek/+archive/ubuntu/panfork-mesa/+files/mali-g610-firmware_1.0.4_all.deb
sudo dpkg -i mali-g610-firmware_1.0.4_all.deb

wget https://launchpad.net/~liujianfeng1994/+archive/ubuntu/panfork-mesa/+build/25602519/+files/libmali-g610-x11_1.0.2.4_arm64.deb
sudo dpkg -i libmali-g610-x11_1.0.2.4_arm64.deb
