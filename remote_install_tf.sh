#!/bin/sh

sbatch -p cpu --nodelist cpu1 -c 64 $HOME/bin/install_tensorflow.sh
