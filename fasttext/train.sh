#!/usr/bin/bash
sudo docker run --privileged --rm -v /tmp/data:/data -v /tmp/result:/result -it hephaex/fasttext ./train.sh $1 $2
