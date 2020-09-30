#!/bin/sh
#Author: Munish (munishstudy73@gmail.com 
#Date: 30/9/20
#Program: Automate freebsdupdate
#Info: Tested on freebsd12
#version: 0.1

LOG_FILE="/var/log/freebsd-update.log"
echo "#################"
freebsd-version | tee ${LOG_FILE}
echo "Starting updates: `date`" | tee ${LOG_FILE}
echo "*****************"
echo "Checking for FreeBSD patches"

freebsd-update fetch | tee ${LOG_FILE}
freebsd-update install | tee ${LOG_FILE}

echo "*****************"

echo "Updating ports tree"

portsnap fetch update | tee ${LOG_FILE}

echo "*****************"

echo "Updating Ports"
pkg update | tee ${LOG_FILE}
pkg version -l '<' | tee ${LOG_FILE}
pkg upgrade | tee ${LOG_FILE}

echo "*****************"

echo "Checking installed ports for known security problems"
pkg audit -F | tee ${LOG_FILE}

echo "Finished updates: `date`" | tee ${LOG_FILE}
echo "#################"
