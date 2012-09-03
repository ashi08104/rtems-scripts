###############################################################################
#!/bin/sh
#
# Fetch, compile and install GCC for RTEMS targets
# $Id: build_gcc_rtems.sh,v 1.5 2006/12/06 16:01:44 hugues Exp $
###############################################################################

mkdir -p $GCC_BUILD_DIR_CROSS
cd $GCC_BUILD_DIR_CROSS

tar xvjf ${ARCHIVES_DIR}/gcc-core-$GCC_VERSION.tar.bz2
tar xvjf ${ARCHIVES_DIR}/gcc-g++-$GCC_VERSION.tar.bz2
tar xvjf ${ARCHIVES_DIR}/gcc-ada-$GCC_VERSION.tar.bz2

patch -p0 < ${ARCHIVES_DIR}/gcc-*.diff

tar zxvf ${ARCHIVES_DIR}/newlib-$NEWLIB_VERSION.tar.gz

patch -p0 < ${ARCHIVES_DIR}/newlib*.diff

cd gcc-$GCC_VERSION
ln -s ../newlib-$NEWLIB_VERSION/newlib ../newlib-$NEWLIB_VERSION/libgloss .
cd ..

for TO_BUILD in $ARCH; do

mkdir b-gcc-$GCC_VERSION-$TO_BUILD-rtems$RTEMS_VERSION
cd b-gcc-$GCC_VERSION-$TO_BUILD-rtems$RTEMS_VERSION

../gcc-$GCC_VERSION/configure --enable-threads -with-gnu-as \
    --with-gnu-ld --with-newlib  --verbose \
    --with-system-zlib --disable-nls \
    --enable-version-specific-runtime-libs \
    --enable-languages=c,c++,ada \
    --target=$TO_BUILD-rtems$RTEMS_VERSION \
    --prefix=$INSTALL_DIR \
    --with-gmp=$INSTALL_DIR --with-mpfr=$INSTALL_DIR --with-mpc=$INSTALL_DIR

make -j 8 all 
make install
cd ..
done