#!/usr/bin/env bash

# Create a temporary directory and cd into it
build_root="$(mktemp -d)"
cd "$build_root"

# Clone Cower repo
git clone https://aur.archlinux.org/cower.git
cd cower

# Import GPG public key
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53

# Build the package
makepkg -sric --noconfirm

cd "$build_root"

# Now it's time to build Pacaur
git clone https://aur.archlinux.org/pacaur.git
cd pacaur
makepkg -sric --noconfirm

cd ~
rm -rf "$build_root"
