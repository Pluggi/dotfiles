#!/bin/bash

sudo systemctl stop NetworkManager.service
sudo macchanger -e enp5s0
sudo systemctl start NetworkManager.service
