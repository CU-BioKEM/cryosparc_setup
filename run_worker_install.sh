../cryosparc_worker/install.sh --license $LICENSE_ID \
                               --cudapath /curc/sw/cuda/11.4/ 

echo "export CRYOSPARC_SSD_PATH=\$SLURM_SCRATCH" >> ../cryosparc_worker/config.sh
