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
cd build/distribution/local/
tar cvf elasticsearch-8.15.0-SNAPSHOT.tar elasticsearch-8.15.0-SNAPSHOT
ls -al build/distribution/local/