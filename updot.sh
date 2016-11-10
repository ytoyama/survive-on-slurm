#!/usr/bin/env bash

export PATH=$PATH:$HOME/ruby/bin
taskset -c 0 brew install bzip2 python
taskset -c 0 pip install MarkupSafe
taskset -c 0 $HOME/.dotfiles/local/bin/updot -b
