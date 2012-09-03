#!/bin/sh

./fetch_rtems_source.sh
./build_autoconf.sh
./build_automake.sh
./build_binutils_rtems.sh
./build_gmp.sh
./build_mpfr.sh
./build_mpc.sh
./build_gcc_native.sh
./build_gcc_rtems_c_only.sh
./build_gcc_rtems.sh
./build_gdb.sh
./build_rtems.sh
