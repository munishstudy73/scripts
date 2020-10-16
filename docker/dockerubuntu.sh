#!/usr/bin/bash
#Author: Munish
#Date: 16/10/20
#Program: Install docker on fresh ubuntu 20.04



sudo apt -y update 
sudo apt -y install   apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt -y update 
##apt-cache policy docker-ce (to check if install from docker repo)
sudo apt -y  install  docker-ce
##sudo systemctl status docker (check status)
