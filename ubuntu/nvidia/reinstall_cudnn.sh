tar -xzvf cudnn-9.1-linux-ppc64le-v7.1.tgz
cp cuda/include/cudnn.h /usr/local/cuda/include/
cp cuda/lib/libcudnn* /usr/local/cuda/lib64/
chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
