#!/bin/sh

export CUDA_HOME=$HOME/root/usr/local/cuda-8.0
export PATH=$HOME/anaconda3/bin:$PATH
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
. activate
bin/tf_test.py
