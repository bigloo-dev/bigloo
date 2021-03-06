#!/bin/sh

HOST=localhost
SSH_PORT=2022
USER=hop

FILE=$1;

if [ -f $FILE ]; then
  exec=/tmp/`basename $FILE`
  scp -P $SSH_PORT $FILE $USER@$HOST:$exec
  ssh -p $SSH_PORT $USER@$HOST "chmod +x $exec"
else
  exec=$*
fi
ssh -p $SSH_PORT $USER@$HOST "$exec"
res=$?
ssh -p $SSH_PORT $USER@$HOST "rm $exec"
exit $res
