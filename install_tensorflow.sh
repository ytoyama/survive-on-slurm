#!/bin/sh

scratch_dir=/scratch/ytoyama
bazel_dir=$scratch_dir/bazel

export PATH=/share/data/vision-greg/common/gcc-4.9.2/bin:$PATH
export CFLAGS="-march=k8 -mtune=generic"
export CXXFLAGS=$CFLAGS

mkdir $scratch_dir &&
mkdir $bazel_dir &&
ln -s $bazel_dir $HOME/.cache/bazel &&
cd $scratch_dir &&
git clone https://github.com/tensorflow/tensorflow &&
cd tensorflow &&
./configure < $HOME/bin/tf_config.txt &&
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package &&
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg &&
ls /tmp/tensorflow_pkg
