#!/bin/sh


if [ -d $GCC_BUILD_DIR_C ]; then
   rm -rf $GCC_BUILD_DIR_C
fi

mkdir -p $GCC_BUILD_DIR_C
cd $GCC_BUILD_DIR_C

tar xjf ${ARCHIVES_DIR}/gcc-core-$GCC_VERSION.tar.bz2
tar xjf ${ARCHIVES_DIR}/gcc-g++-$GCC_VERSION.tar.bz2
tar xjf ${ARCHIVES_DIR}/gcc-ada-$GCC_VERSION.tar.bz2
tar zxf ${ARCHIVES_DIR}/newlib-$NEWLIB_VERSION.tar.*

cd newlib-$NEWLIB_VERSION
patch -p1 < `ls ${ARCHIVES_DIR}/newlib*.diff`
cd ..

cd gcc-$GCC_VERSION
patch -p1 < `ls ${ARCHIVES_DIR}/gcc-*.diff`
rm newlib
rm libgloss
ln -s ../newlib-$NEWLIB_VERSION/newlib .
cd ..

for TO_BUILD in $ARCH; do

rm -rf b-gcc-$GCC_VERSION-$TO_BUILD-rtems$RTEMS_VERSION-C
mkdir b-gcc-$GCC_VERSION-$TO_BUILD-rtems$RTEMS_VERSION-C
cd b-gcc-$GCC_VERSION-$TO_BUILD-rtems$RTEMS_VERSION-C

../gcc-$GCC_VERSION/configure --enable-threads -with-gnu-as \
    --disable-multilib \
    --with-gnu-ld --with-newlib  --verbose \
    --with-system-zlib --disable-nls \
    --enable-version-specific-runtime-libs \
    --enable-languages=c,c++ \
    --target=$TO_BUILD-rtems$RTEMS_VERSION \
    --prefix=$INSTALL_DIR \
    --with-gmp=$INSTALL_DIR --with-mpfr=$INSTALL_DIR --with-mpc=$INSTALL_DIR

make -j 8 all 
make install
cd ..
done
