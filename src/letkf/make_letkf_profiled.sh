#!/bin/sh
#
# This routine prepares the executable for analysis with perftools (Craypat)
# http://portal.nersc.gov/project/training/files/XE6-feb-2011/Presentations-2011-02-08/PerformanceTools.pdf
#
set -ex

source ../../config/machine.sh
source ../../config/$MACHINE.fortran.sh
source ../../config/$MACHINE.netcdf.sh

# Ensemble size
# STEVE: figure out how to read from params_letkf.f90 and put here (e.g. with awk/perl/etc.)
MEM=056
# Experiment name
name=PROFILE
# Executable for letkf
PGM=letkf.$name.$MEM

OMP=
PWD=`pwd`
BLAS=1 #0: no blas 1: using blas
#STEVE: ask about blas on zeus
sh ulnkcommon.sh
sh lnkcommon.sh
rm -f *.mod
rm -f *.o

cat netlib.f > netlib2.f
if test $BLAS -eq 1
then
  LBLAS="-L${CRAY_LIBSCI_PREFIX_DIR}/lib -lsci_intel -lsci_intel_mp"
else
  cat netlibblas.f >> netlib2.f
  LBLAS=""
fi

$F90 $OMP $F90_OPT $F90_DEBUG $F90_INLINE $F90_OBJECT_FLAG SFMT.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_INLINE $F90_OBJECT_FLAG common.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG common_mpi.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_INLINE $F90_OBJECT_FLAG common_mtx.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_INLINE $F90_OBJECT_FLAG netlib2.f
$F90 $OMP $F90_OPT $F90_DEBUG $F90_INLINE $F90_OBJECT_FLAG params_letkf.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG common_letkf.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG params_model.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG vars_model.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_INLINE $NETCDF_INC $F90_OBJECT_FLAG common_mom4.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG params_obs.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG vars_obs.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG common_obs_mom4.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG $NETCDF_INC common_mpi_mom4.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG letkf_obs.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG letkf_local.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG letkf_local.o letkf_tools.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_OBJECT_FLAG letkf.f90
$F90 $OMP $F90_OPT $F90_DEBUG $F90_INLINE -o ${PGM} *.o $MPI_LIB $NETCDF_LIB $LBLAS

# Setup profiler:
pat_build ${PGM}

#STEVE: keep a record of the build:
mkdir -p CONFIG_$PGM
cp *.f90 CONFIG_$PGM/

rm -f *.mod
rm -f *.o
rm -f netlib2.f
sh ulnkcommon.sh

echo "STEVE: min temp is set to -4 ºC and max salt is set to 50.0 psu incommon_mom4:: write_grd4"
echo "STEVE: don't forget - in phys2ijk, obs above model level 1 are set to model level 1"
echo "NORMAL END"