#!/bin/bash

sudo pacman -Sy archlinux-keyring endeavouros-keyring

sudo rm -rf /etc/pacman.d/gnupg

sudo pacman-key --init

sudo pacman-key --populate archlinux endeavouros

sudo eos-rankmirrors
