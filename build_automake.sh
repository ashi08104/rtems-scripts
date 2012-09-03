###############################################################################
#!/bin/sh
#
# Fetch, compile and install AUTOMAKE
# $Id: build_automake.sh,v 1.1 2006/12/06 16:20:42 hugues Exp $
###############################################################################

mkdir -p $AUTOMAKE_BUILD_DIR
cd $AUTOMAKE_BUILD_DIR

tar zxvf ${ARCHIVES_DIR}/automake-$AUTOMAKE_VERSION.tar.*

mkdir b-automake-$AUTOMAKE_VERSION-rtems$RTEMS_VERSION
cd b-automake-$AUTOMAKE_VERSION-rtems$RTEMS_VERSION

../automake-$AUTOMAKE_VERSION/configure --prefix=$INSTALL_DIR

make all install
cd ..
