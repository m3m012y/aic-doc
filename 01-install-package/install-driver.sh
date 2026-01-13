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
