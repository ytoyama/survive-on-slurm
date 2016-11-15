#!/bin/sh

. $HOME/anaconda3/bin/activate

scratch_dir=/scratch/ytoyama
bazel_dir=$scratch_dir/bazel

export CFLAGS="-march=k8 -mtune=generic"
export CXXFLAGS=$CFLAGS
export CC=$HOME/anaconda3/bin/gcc
export LIBRARY_PATH=$HOME/anaconda3/lib64
export LD_LIBRARY_PATH=$LIBRARY_PATH

mkdir -p $scratch_dir &&
mkdir -p $bazel_dir &&

if [ ! -r $HOME/.cache/bazel ]
then
  ln -s $bazel_dir $HOME/.cache/bazel
fi &&

cd $scratch_dir &&

if [ ! -d tensorflow ]
then
  git clone https://github.com/tensorflow/tensorflow
fi &&

cd tensorflow &&
./configure < $HOME/bin/tf_config.txt &&
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package &&
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg &&
ls /tmp/tensorflow_pkg
