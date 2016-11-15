#!/usr/bin/env bash

export PATH=$HOME/ruby-2.3.1:$PATH:/share/data/vision-greg/common/git-2.10.0/bin
export HOMEBREW_MAKE_JOBS=8
export HOMEBREW_ARCH="k8 -mtune=generic"

taskset -c 0,1,2,3,4,5,6,7 $HOME/.dotfiles/local/bin/updot -b &&
taskset -c 0,1,2,3,4,5,6,7 brew install bzip2 python python3 bazel &&
taskset -c 0,1,2,3,4,5,6,7 pip install MarkupSafe
