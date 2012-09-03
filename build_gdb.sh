###############################################################################
#!/bin/sh
#
# Fetch, compile and install GDB
# $Id: build_gdb.sh,v 1.2 2006/12/20 11:38:23 hugues Exp $
###############################################################################

mkdir -p $GDB_BUILD_DIR
cd $GDB_BUILD_DIR

tar xvjf ${ARCHIVES_DIR}/gdb-$GDB_VERSION.tar.bz2
patch -p0 < ${ARCHIVES_DIR}/gdb-*.diff

for TO_BUILD in $ARCH; do

mkdir b-gdb-$GDB_VERSION-rtems$RTEMS_VERSION
cd b-gdb-$GDB_VERSION-rtems$RTEMS_VERSION

../gdb-$GDB_VERSION/configure --prefix=$INSTALL_DIR --disable-nls \
    --target=$TO_BUILD-rtems$RTEMS_VERSION 

make
make install
cd ..
done
