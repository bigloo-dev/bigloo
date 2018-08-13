#!/bin/sh
#*=====================================================================*/
#*    /tmp/BIGLOO/bigloo/onpush/bigloo/install.sh                      */
#*    -------------------------------------------------------------    */
#*    Author      :  Manuel Serrano                                    */
#*    Creation    :  Mon Aug 13 16:09:31 2018                          */
#*    Last change :  Mon Aug 13 16:19:07 2018 (serrano)                */
#*    Copyright   :  2018 Manuel Serrano                               */
#*    -------------------------------------------------------------    */
#*    Bigloo install file                                              */
#*=====================================================================*/

[ -z "$CC" ] && CC=gcc
[ -z "$CFLAGS" ] && CFLAGS=-O3

if [ !-d $ONPUSH_DIR/opt/bigloo ]; then
  mkdir -p $ONPUSH_DIR/bootstrap/bigloo
  mkdir -p $ONPUSH_DIR/bootstrap/bigloo/dowload
  
  # download a install a first Bigloo version used to bootstrap the github repo
  wget ftp://ftp-sop.inria.fr/indes/fp/Bigloo/bigloo4.3b-last.tar.gz -O $ONPUSH_DIR/bootstrap/bigloo4.3b-last.tar.gz

  # install that version
  (cd $ONPUSH_DIR/bootstrap/bigloo4.3b-last.tar.gz; \
   tar xvfz bigloo4.3b-last.tar.gz; \
   cd bigloo4.3b; \
   ./configure --prefix=$ONPUSH_DIR/bootstrap --disable-avahi --disable-alsa --disable-gstreamer --disable-pulseaudio --disable-mpg123 --disable-flag --disable-multimedia --jvm=no; \
   make; \
   make install)
fi

# install the current Bigloo version
if [ ! -z "`git diff HEAD HEAD^ ./configure`" -o ! -f config.log -o ! -d $ONPUSH_DIR/local ]; then
  echo "configuring bigloo..."
  ./configure --prefix=$ONPUSH_DIR/local --cc=$CC --cflags=$CFLAGS --bigloo|| exit 1
  make bigboot BGLBUILBINDIR=$ONPUSH_DIR/bootstrap/bin
  make install-progs
  echo "compiling and testing bigloo... "
  make -j fullbootstrap-sans-log CONFIGUREOPTS="--jvm=no"
  make test && make install
else  
  echo "compiling bigloo... "
  make -j && make install
fi

  


