#!/bin/bash
 

# ============================================================
# REQUIRED: Data Paths (MUST exist on the PVC)
# ============================================================
# You need to either:
# Option A: Use data already on the PVC
# Option B: Copy data to the PVC first
export DATA_DIR="/data/datasets"     # Path on the PVC where data will be
export SOURCE_DIR=$(pwd)
# ============================================================
# OPTIONAL: Resource Configuration
# ============================================================
export NODES=1                                       # Start with 1 node for testing
export GPUS_PER_NODE=1                               # Start with 1 GPU for testing
export NPROC_PER_NODE=1                              # Match GPUS_PER_NODE

# ============================================================
# OPTIONAL: Container Configuration
# ============================================================
# The default image may not have verl installed!
# You have two options:
# Option 1: Use default image + install verl from source

# <container-registry-name>.azurecr.io/<image-name>:<image-tag>
export CONTAINER_IMAGE_PATH="aifrontiers.azurecr.io/nvidia25.11-pytorch2.9.1-te2.10-deepspeed0.18.4-flashattn2.8.3.dev-vllm0.13.0:20260112"
#export CONTAINER_IMAGE_PATH="nvcr.io/nvidia/pytorch:25.08-py3"
export INSTALL_PACKAGE=1                             # This will pip install -e . your source dir

# Option 2: Use a custom image with verl pre-installed (faster)
# export CONTAINER_IMAGE_PATH="your-registry/verl-image:tag"
# export INSTALL_PACKAGE=0

# ============================================================
# OPTIONAL: Environment Variables to Transfer
# ============================================================
export WANDB_API_KEY="a9dddea045e5426079a23680e449624f771620ec"           # Get from wandb.ai/settings
export WANDB_HOST="https://microsoft-research.wandb.io"
export WANDB_PROJECT="verl-test"
export VLLM_ATTENTION_BACKEND="FLASH_ATTN"
export HF_TOKEN=${HF_TOKEN}

export TRANSFER_VARS="WANDB_API_KEY WANDB_HOST WANDB_PROJECT VLLM_ATTENTION_BACKEND HF_TOKEN"

export PROJECT_NAME="orthonormal-updates" 
export JOB_NAME="p1-verl-test"
export PRIORITY="low"
# ============================================================
# OPTIONAL: Torchrun Configuration
# ============================================================
export USE_TORCHRUN=0                                # verl.trainer.main_ppo handles distributed internally
                                                     