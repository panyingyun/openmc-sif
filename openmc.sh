#!/bin/bash

echo "openmc dependence is ready."
sudo apptainer build openmc_v0.15.3.sif openmc.def
echo "openmc image build successful."
