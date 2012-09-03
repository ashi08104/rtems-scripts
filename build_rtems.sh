###############################################################################
#!/bin/sh
#
# Generic script, fetch various RTEMS components
# $Id: build_rtems.sh,v 1.9 2006/12/07 11:12:02 hugues Exp $
###############################################################################

mkdir -p $RTEMS_BUILD_DIR
cd $RTEMS_BUILD_DIR

#tar xvjf ${ARCHIVES_DIR}/rtems-*.bz2
ln -s $HOME/jerome/rtems .
cd rtems
git pull
./bootstrap
cd ..
mkdir build-rtems-$RTEMS_VERSION
cd build-rtems-$RTEMS_VERSION

../rtems/configure --target=$BUILD_ARCH-rtems$RTEMS_VERSION \
    --enable-rdbg --enable-rtemsbsp="$BUILD_BSP" \
    --enable-networking --enable-cxx --enable-posix --enable-tests \
    --enable-multilib --prefix=$INSTALL_DIR

make -j 8 all 
make install

