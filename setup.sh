#!/bin/sh
LOCAL_BIN=~/.local/bin
SCRIPT_FULL_PATH=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT_FULL_PATH)

echo "mkdir -p $LOCAL_BIN"
mkdir -p "$LOCAL_BIN"

for sh_file in ${SCRIPT_DIR}/local_bin;
do
	SH_FIKE_FULLPATH=$(readlink -f $sh_file)
	echo "ln -s $SH_FIKE_FULLPATH $LOCAL_BIN"
	ln -s "$SH_FIKE_FULLPATH" "$LOCAL_BIN"
	echo "chmod +x $SH_FIKE_FULLPATH"
	chmod +x "$SH_FIKE_FULLPATH"
done

DOCKER_CNT=$(cat $SCRIPT_DIR/local_bin/docker_cnt.txt)
sudo docker build dockers/tf-gpu-py3-r-keras -t $DOCKER_CNT
