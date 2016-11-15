#!/bin/sh

sbatch -p cpu --nodelist cpu0 -c 12 bin/taskset.sh 0,1,2,3,4,5,6,7,8,9,10,11 \
    $HOME/bin/install_tensorflow.sh
