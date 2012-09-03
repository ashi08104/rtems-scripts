###############################################################################
#!/bin/sh
#
# Fetch, compile and install GCC for native platform
# $Id: build_gcc_native.sh,v 1.2 2006/12/06 16:01:44 hugues Exp $
###############################################################################

mkdir -p $GCC_BUILD_DIR
cd $GCC_BUILD_DIR

tar xvjf ${ARCHIVES_DIR}/gcc-core-$GCC_VERSION.tar.bz2
tar xvjf ${ARCHIVES_DIR}/gcc-g++-$GCC_VERSION.tar.bz2
tar xvjf ${ARCHIVES_DIR}/gcc-ada-$GCC_VERSION.tar.bz2

mkdir b-gcc-$GCC_VERSION
cd b-gcc-$GCC_VERSION

../gcc-$GCC_VERSION/configure --verbose --disable-nls \
    --enable-languages=c,c++,ada --prefix=$INSTALL_DIR \
    --with-gmp=$INSTALL_DIR --with-mpfr=$INSTALL_DIR --with-mpc=$INSTALL_DIR

make -j 8 all
make install

