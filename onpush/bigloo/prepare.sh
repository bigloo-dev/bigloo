#!/bin/bash
#*=====================================================================*/
#*    /tmp/BIGLOO/bigloo/onpush/bigloo/prepare.sh                      */
#*    -------------------------------------------------------------    */
#*    Author      :  Manuel Serrano                                    */
#*    Creation    :  Mon Aug 13 16:19:56 2018                          */
#*    Last change :  Thu Aug 16 11:53:49 2018 (serrano)                */
#*    Copyright   :  2018 Manuel Serrano                               */
#*    -------------------------------------------------------------    */
#*    Benchmarks compilation                                           */
#*=====================================================================*/

$PROJECT_DIR/bin/bigloo -Obench -o $TMP/$2 $PROJECT_DIR/bench/$2/$2.scm

