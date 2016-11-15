#!/bin/sh

. $HOME/anaconda3/bin/activate

scratch_dir=/scratch/ytoyama
bazel_dir=$scratch_dir/bazel
anaconda_dir=$HOME/anaconda3
anaconda_bin_dir=$anaconda_dir/bin

export CFLAGS="-march=k8 -mtune=generic"
export CXXFLAGS=$CFLAGS
export CC=$anaconda_bin_dir/gcc
export LIBRARY_PATH=$anaconda_dir/lib64
export LD_LIBRARY_PATH=$LIBRARY_PATH

for bin in as ld nm
do
  if [ ! -f $anaconda_bin_dir/$bin ]
  then
    ln -s /usr/bin/$bin $anaconda_bin_dir/$bin
  fi
done

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

pkg_dir=$HOME/tensorflow_pkg

cd tensorflow &&
git checkout r0.11 &&
./configure < $HOME/bin/tf_config.txt &&
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package &&
bazel-bin/tensorflow/tools/pip_package/build_pip_package $pkg_dir &&
pip install $pkg_dir/tensorflow-0.11.0-py3-none-any.whl
