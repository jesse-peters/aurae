#!/bin/bash
# Variables
ARCH=$(uname -m)
OS=$(uname -s)
BUF_VERSION=1.12.0

# Update packages and install dependencies
sudo apt-get update && sudo apt-get install -y protobuf-compiler musl-tools musl-dev llvm clang wget gpg

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Install buf
sudo wget "https://github.com/bufbuild/buf/releases/download/v$BUF_VERSION/buf-$OS-$ARCH" -O "/usr/local/bin/buf" && sudo chmod +x "/usr/local/bin/buf"

# Install Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install -y apt-transport-https
sudo apt update -y
sudo apt install -y code


# Set environment variables and build
#### I do not know why I need this section, but I cannot build without it ####
sudo apt-get update && sudo apt-get install -y llvm clang

echo 'export CC_aarch64_unknown_linux_musl=clang' >> ~/.bashrc
echo 'export AR_aarch64_unknown_linux_musl=llvm-ar' >> ~/.bashrc
echo 'export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_MUSL_RUSTFLAGS="-Clink-self-contained=yes -Clinker=rust-lld"' >> ~/.bashrc

############  END UNKOWN  ##############
