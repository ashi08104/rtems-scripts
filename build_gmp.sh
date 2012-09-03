###############################################################################
# Fetch, compile and install GMP
###############################################################################
#!/bin/sh

mkdir -p $GMP_BUILD_DIR
cd $GMP_BUILD_DIR

tar xvjf ${ARCHIVES_DIR}/gmp-$GMP_VERSION.tar.*

mkdir b-gmp-$GMP_VERSION-rtems$RTEMS_VERSION
cd b-gmp-$GMP_VERSION-rtems$RTEMS_VERSION

../gmp-$GMP_VERSION/configure --prefix=$INSTALL_DIR

make all install
cd ..
