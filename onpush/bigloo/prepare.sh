#!/bin/bash
#*=====================================================================*/
#*    /tmp/BIGLOO/bigloo/onpush/bigloo/prepare.sh                      */
#*    -------------------------------------------------------------    */
#*    Author      :  Manuel Serrano                                    */
#*    Creation    :  Mon Aug 13 16:19:56 2018                          */
#*    Last change :  Mon Aug 13 16:33:03 2018 (serrano)                */
#*    Copyright   :  2018 Manuel Serrano                               */
#*    -------------------------------------------------------------    */
#*    Benchmarks compilation                                           */
#*=====================================================================*/

$ONPUSH_DIR/local/bin/bigloo -Obench -o $TMP/$2 $PROJECT_DIR/bench/src/$2.scm

