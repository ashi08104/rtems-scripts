###############################################################################
# Fetch, compile and install MPC
###############################################################################
#!/bin/sh

mkdir -p $MPC_BUILD_DIR
cd $MPC_BUILD_DIR

tar xzvf ${ARCHIVES_DIR}/mpc-$MPC_VERSION.tar.*

mkdir b-mpc-$MPC_VERSION-rtems$RTEMS_VERSION
cd b-mpc-$MPC_VERSION-rtems$RTEMS_VERSION

../mpc-$MPC_VERSION/configure --prefix=$INSTALL_DIR \
    --with-gmp=$INSTALL_DIR --with-mpfr=$INSTALL_DIR

make all install
cd ..
