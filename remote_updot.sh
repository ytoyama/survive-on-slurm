#!/bin/sh

sbatch -p cpu --nodelist cpu1 -c 8 $HOME/bin/updot.sh
