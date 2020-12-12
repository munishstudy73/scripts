#!/bin/ksh

LOG_FILE="/var/log/openbsd-update.log"

echo "#################"
/usr/bin/uname -a | /usr/bin/tee -a  ${LOG_FILE}
echo "Starting updates: `date`" | /usr/bin/tee -a ${LOG_FILE}
echo "*****************"
echo "Checking for openBSD patches"

/usr/sbin/syspatch | /usr/bin/tee -a ${LOG_FILE}

echo "*****************"

echo "Updating ports tree"
cd /usr/ports
/usr/bin/cvs -q up -Pd -rOPENBSD_6_8 | /usr/bin/tee -a ${LOG_FILE}

echo "*****************"

echo "Updating Packages"
pkg_add -uv | /usr/bin/tee -a ${LOG_FILE}

echo "*****************"

echo "Finished updates: `date`" | /usr/bin/tee -a ${LOG_FILE}
echo "#################"#


