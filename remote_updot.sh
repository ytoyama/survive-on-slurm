#!/bin/sh

sbatch -p cpu --nodelist=cpu1 -c 1 updot.sh
