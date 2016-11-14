#!/usr/bin/env bash

export PATH=$PATH:$HOME/ruby/bin
export CFLAGS="-O0 -g"
export CXXFLAGS=$CFLAGS
export HOMEBREW_MAKE_JOBS=8
taskset -c 0,1,2,3,4,5,6,7 brew install bzip2 python
taskset -c 0,1,2,3,4,5,6,7 pip install MarkupSafe
taskset -c 0,1,2,3,4,5,6,7 $HOME/.dotfiles/local/bin/updot -b
