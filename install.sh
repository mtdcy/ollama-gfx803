#!/bin/bash -e

grep -Fw "Ubuntu 22.04" /etc/os-release || {
    echo "ollama-gfx803 only works with Ubuntu 22.04"
    exit 1
}

sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
sudo apt install -y python3-setuptools python3-wheel
sudo usermod -a -G render,video "$LOGNAME"

# install rocm
#wget https://repo.radeon.com/amdgpu-install/5.4.1/ubuntu/jammy/amdgpu-install_5.4.50401-1_all.deb
sudo apt install -y ./amdgpu-install_5.4.50401-1_all.deb
amdgpu-install --usecase=rocmdev

# fix missing headers
sudo apt install -y libstdc++-12-dev

# patch rocblas: DON'T install this deb
#wget https://github.com/xuhuisheng/rocm-gfx803/releases/download/rocm541/rocblas_2.46.0.50401-84.20.04_amd64.deb
dpkg-deb -x rocblas_2.46.0.50401-84.20.04_amd64.deb .
sudo rsync -av ./opt/ /opt/

# install missing cmake files
sudo rsync -av ./cmake/ /opt/rocm/lib/cmake/

# install newer go
#wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.23.6.linux-amd64.tar.gz

export PATH="/usr/local/go/bin:$PATH"

# install build essentials
sudo apt install build-essential cmake meson

# build rocm
export PATH="/opt/rocm/bin:$PATH"
if [ ! -d ollama ]; then
    git clone https://github.com/ollama/ollama.git
    cd ollama
    git checkout v0.5.8
    patch -p1 -N -r - < ../gfx803.patch
else
    cd ollama
fi

# checkout branch if you want

# build & install
cmake -B build -GNinja -DAMDGPU_TARGETS="gfx803"
ninja -C build
sudo cmake --install build

go build
sudo cp ollama /usr/local/bin

sudo cp ../ollama.service /etc/systemd/system/ollama.service

sudo useradd -r -s /bin/false -U -m -d /home/ollama ollama
sudo usermod -aG render,video ollama
sudo chown -R ollama:ollama /usr/local/lib/ollama
sudo chmod -R 0755 /usr/local/lib/ollama /usr/local/bin/ollama

sudo systemctl daemon-reload
sudo systemctl enable ollama.service --now
