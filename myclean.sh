#!/bin/bash
#clean all key related dir
BUILD_ROOT=/home/ashi/projects/b-sis

cd $BUILD_ROOT/sparc-rtems4.11/c/sis/testsuites/psxtests/psx06
make clean
cd $BUILD_ROOT/sparc-rtems4.11/c/sis/testsuites/psxtests/psxkey01
make clean
cd $BUILD_ROOT/sparc-rtems4.11/c/sis/testsuites/psxtests/psxkey02
make clean
cd $BUILD_ROOT/sparc-rtems4.11/c/sis/testsuites/psxtests/psxkey03
make clean

#copy the header and inline file

if [ "$1" == "new" ];
then
    cd $BUILD_ROOT
    cp ../rtems/cpukit/posix/include/rtems/posix/threadsup.h ./sparc-rtems4.11/sis/lib/include/rtems/posix/threadsup.h
    cp ../rtems/cpukit/posix/include/rtems/posix/key.h ./sparc-rtems4.11/sis/lib/include/rtems/posix/key.h
    cp ../rtems/cpukit/posix/inline/rtems/posix/key.inl ./sparc-rtems4.11/sis/lib/include/rtems/posix/key.inl
fi