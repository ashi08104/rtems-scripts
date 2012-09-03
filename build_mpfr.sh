###############################################################################
# Fetch, compile and install MPFR
###############################################################################
#!/bin/sh

mkdir -p $MPFR_BUILD_DIR
cd $MPFR_BUILD_DIR

tar xjvf ${ARCHIVES_DIR}/mpfr-$MPFR_VERSION.tar.*

mkdir b-mpfr-$MPFR_VERSION-rtems$RTEMS_VERSION
cd b-mpfr-$MPFR_VERSION-rtems$RTEMS_VERSION

../mpfr-$MPFR_VERSION/configure --prefix=$INSTALL_DIR --with-gmp=$INSTALL_DIR

make all install
cd ..
