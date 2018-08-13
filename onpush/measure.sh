#!/bin/bash

system=$1
benchmark=$2

mkdir -p $ONPUSH_DIR/results/$system/$HOSTNAME

times=
cycles=
sep="["

TIMEFORMAT="%3R"
export TIMEFORMAT

for ((i=0; i<$NBITER; i++)) do
  tm=`time $TMP/$benchmark  2>&1 > /dev/null`
  cy=`$ONPUSH_DIR/lib/perfcycles $TMP/$benchmark 2>&1`

  times="$times$sep $tm"
  cycles="$cycles$sep $cy"

  sep=","
done

echo "{ times: $times ], cycles: $cycles ] }" > $ONPUSH_DIR/results/$system/$HOSTNAME/$benchmark.json

cat $ONPUSH_DIR/results/$system/$HOSTNAME/$benchmark.json
