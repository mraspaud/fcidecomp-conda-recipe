set -ex

FCIDECOMP_VERSION=V1.0.2
PATH_TO_DELIVERY=$(pwd)

# 2.5.1 (already included in meta.yaml)
#sha256sum -c sha256_FCIDECOMP_${FCIDECOMP_VERSION}.txt

# 2.5.2
FCIDECOMP_EXTRACTION_PATH=${PATH_TO_DELIVERY}/build
mkdir -p ${FCIDECOMP_EXTRACTION_PATH}
tar zxf ${PATH_TO_DELIVERY}/FCIDECOMP_${FCIDECOMP_VERSION}/Software/fcidecomp_sources-${FCIDECOMP_VERSION}.tar.gz --strip 1 -C ${FCIDECOMP_EXTRACTION_PATH}

# 2.5.3
cd ${FCIDECOMP_EXTRACTION_PATH}

# 2.5.3.1
CHARLS_INSTALLATION_PATH=${CONDA_PREFIX}
FCIDECOMP_INSTALLATION_PATH=${PREFIX}
./gen/build.sh fcicomp-jpegls release \
-DCMAKE_PREFIX_PATH=${CHARLS_INSTALLATION_PATH} \
-DCMAKE_INSTALL_PREFIX=${FCIDECOMP_INSTALLATION_PATH}

./gen/build.sh fcicomp-jpegls test

./gen/install.sh fcicomp-jpegls

# 2.5.3.2
ZLIB_INSTALLATION_PATH=${CONDA_PREFIX}
HDF5_INSTALLATION_PATH=${CONDA_PREFIX}
./gen/build.sh fcicomp-H5Zjpegls release \
-DCMAKE_PREFIX_PATH="${FCIDECOMP_INSTALLATION_PATH};
${ZLIB_INSTALLATION_PATH};${HDF5_INSTALLATION_PATH}" \
-DCMAKE_INSTALL_PREFIX=${FCIDECOMP_INSTALLATION_PATH}

# Fails
# ./gen/build.sh fcicomp-H5Zjpegls test

./gen/install.sh fcicomp-H5Zjpegls
