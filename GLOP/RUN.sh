#!/bin/bash

PROJECT_DIR=$PWD
ONPUSH_DIR=$PROJECT_DIR/onpush
COMMIT=`git rev-parse --short HEAD`
[ -z "$HOST" ] && HOST=`hostname`
TMP=$ONPUSH_DIR/tmp
NBITER=3
BRANCH=$1


. $ONPUSH_DIR/CONFIG.sh

for h in $HOSTS; do 
  if [ "$h " = "$HOST " ]; then
    mkdir -p $TMP
  
    for s in $SYSTEMS; do
      if [ -d $ONPUSH_DIR/$s ]; then
        echo "system $s"
        set -a
        source $ONPUSH_DIR/install.sh $s || exit 1
	for b in $BENCHMARKS; do
          source $ONPUSH_DIR/prepare.sh $s $b
          source $ONPUSH_DIR/measure.sh $s $b
	done
        source $ONPUSH_DIR/commit.sh $s
        source $ONPUSH_DIR/cleanup.sh $s
        set +a
        echo "system $s...done"
      fi
    done
  fi  
done
