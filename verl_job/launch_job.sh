#!/bin/bash
# launch_job.sh

# Load your configuration
source set_env.sh  # The file from Step 1

# Set the source directory (where verl code or your project is)
export SOURCE_DIR="."

# Set paths that will be available inside the container 
export OUTPUT_ROOT="/data/${USER}/verl-outputs"

# Add to transfer vars
export TRANSFER_VARS="${TRANSFER_VARS} DATA_ROOT OUTPUT_ROOT NODES GPUS_PER_NODE JOB_NAME"

# Submit the job
vsubmit.sh bash train_verl.sh