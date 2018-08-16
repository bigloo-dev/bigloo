#!/bin/sh
#*=====================================================================*/
#*    /tmp/BIGLOO/bigloo/onpush/bigloo/install.sh                      */
#*    -------------------------------------------------------------    */
#*    Author      :  Manuel Serrano                                    */
#*    Creation    :  Mon Aug 13 16:09:31 2018                          */
#*    Last change :  Thu Aug 16 08:30:25 2018 (serrano)                */
#*    Copyright   :  2018 Manuel Serrano                               */
#*    -------------------------------------------------------------    */
#*    Bigloo install file                                              */
#*=====================================================================*/

[ -z "$CC" ] && CC=gcc
[ -z "$CFLAGS" ] && CFLAGS=-O3

if [ ! -f $ONPUSH_DIR/bootstrap/bigloo ]; then
  mkdir -p $ONPUSH_DIR/bootstrap/bigloo
  mkdir -p $ONPUSH_DIR/download
  
  # download a install a first Bigloo version used to bootstrap the github repo
  if [ ! -f $ONPUSH_DIR/bootstrap/download/bigloo4.3b-last.tar.gz ]; then
    wget ftp://ftp-sop.inria.fr/indes/fp/Bigloo/bigloo4.3b-last.tar.gz -O $ONPUSH_DIR/bootstrap/download/bigloo4.3b-last.tar.gz
  fi

  # install that version
  (cd $ONPUSH_DIR/bootstrap/bigloo; \
   echo "Untaring bigloo..."; \
   tar xfz ../download/bigloo4.3b-last.tar.gz; \
   cd bigloo4.3b; \
   ./configure --prefix=$ONPUSH_DIR/bootstrap/bigloo --disable-avahi --disable-alsa --disable-gstreamer --disable-pulseaudio --disable-mpg123 --disable-flac --disable-multimedia --disable-wav --jvm=no; \
   echo "Compiling bootstrap Bigloo $(PWD)"; \
   make -j; \
   make install)
fi

# install the current Bigloo version
if [ ! -z "`git diff HEAD HEAD^ ./configure`" -o ! -f config.log -o ! -d $ONPUSH_DIR/local ]; then
  echo "configuring bigloo..."
  ./configure --prefix=$ONPUSH_DIR/local --cc=$CC --cflags=$CFLAGS || exit 1
  make bigboot BGLBUILBINDIR=$ONPUSH_DIR/bootstrap/bigloo/bin
  make install-progs
  echo "compiling and testing bigloo... "
  make -j fullbootstrap-sans-log CONFIGUREOPTS="--jvm=no"
  make test && make install
else  
  echo "compiling bigloo... "
  make -j && make install
fi

  


