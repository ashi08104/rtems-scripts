#!/bin/sh

die () {
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "%% ERROR when ${1}"
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    exit 1
}

# Build ARCHIVES_DIR if it is non existent

if test ! -d "${ARCHIVES_DIR}"; then
    mkdir -p "${ARCHIVES_DIR}" || die "creating ${ARCHIVES_DIR}"
    echo "Creating '${ARCHIVES_DIR}': DONE"
fi

# Fetch all source file from the MANIFEST

cd ${ARCHIVES_DIR}

echo Fetch source from MANIFEST file: ${MANIFEST_FILE}

for file in `cat ${MANIFEST_FILE}`; do
    echo Fetch $file
    wget -N $file
    #curl --socks5 192.168.0.1:7071 -O $file
done
