###############################################################################
# Fetch, compile and install AUTOCONF
###############################################################################
#!/bin/sh

mkdir -p $AUTOCONF_BUILD_DIR
cd $AUTOCONF_BUILD_DIR

tar xvjf ${ARCHIVES_DIR}/autoconf-$AUTOCONF_VERSION.tar.*

mkdir b-autoconf-$AUTOCONF_VERSION-rtems$RTEMS_VERSION
cd b-autoconf-$AUTOCONF_VERSION-rtems$RTEMS_VERSION

../autoconf-$AUTOCONF_VERSION/configure --prefix=$INSTALL_DIR

make all install
cd ..
