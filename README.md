# FastText Docker
The fasttest is "Library for efficient text classification and representation learning"

# What is FastText?
FastText is an open-source, free, lightweight library that allows users to learn text representations and text classifiers. It works on standard, generic hardware. Models can later be reduced in size to even fit on mobile devices.

# Getting Started

The quickest way to see the fastText classification tutorial with fastText-docker is:
```
docker pull hephaex/fasttext
mkdir -p /tmp/data && mkdir -p /tmp/result
./fasttext.sh
```

# model generate

```
docker pull hephaex/fasttext
mkdir -p /tmp/data && mkdir -p /tmp/result
./train.sh $[input data] $[model name]
```

usage: train.sh <input data> <model name>
