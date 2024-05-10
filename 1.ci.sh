#!/usr/bin/env bash
set -x
echo "hello world"
cd ~
git clone --depth 1 https://github.com/elastic/elasticsearch.git 
cd elasticsearch
./gradlew localDistro
./gradlew :distribution:archives:linux-tar:assembl

# tree -L 3
ls -al build/distribution/local/