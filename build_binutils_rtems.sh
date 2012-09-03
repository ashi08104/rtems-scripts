###############################################################################
#!/bin/sh
#
# Fetch, compile and install BINUTILS
# $Id: build_binutils_rtems.sh,v 1.3 2006/12/06 16:01:44 hugues Exp $
###############################################################################

mkdir -p $BINUTILS_BUILD_DIR
cd $BINUTILS_BUILD_DIR

tar xvjf ${ARCHIVES_DIR}/binutils-$BINUTILS_VERSION.tar.bz2

for TO_BUILD in $ARCH; do

mkdir b-binutils-$BINUTILS_VERSION-$TO_BUILD-rtems$RTEMS_VERSION
cd b-binutils-$BINUTILS_VERSION-$TO_BUILD-rtems$RTEMS_VERSION

../binutils-$BINUTILS_VERSION/configure  --verbose --disable-nls \
    --target=$TO_BUILD-rtems$RTEMS_VERSION --prefix=$INSTALL_DIR

make all install
cd ..
done
