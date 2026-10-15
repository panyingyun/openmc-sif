#!/bin/bash

echo "openmc dependence is ready."

if [ ! -f "./dependence/openmc_v0.15.3.tar.gz" ];then
  wget http://10.0.1.66:4000/api/download/singularity/openmc/openmc_v0.15.3.tar.gz -O ./dependence/openmc_v0.15.3.tar.gz
  echo "download openmc_v0.15.3.tar.gz successful."
fi

sudo apptainer build openmc_v0.15.3.sif openmc.def
echo "openmc image build successful."
