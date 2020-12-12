#!/bin/ksh
# add and commit changes
cd /etc && /usr/local/bin/git add --all && /usr/local/bin/git commit -m "Commit: `date`"
# send data to Git server
cd /etc && /usr/local/bin/git push origin master
