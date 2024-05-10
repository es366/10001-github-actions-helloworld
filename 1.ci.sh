#!/usr/bin/env bash
set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
echo $PROJECT_NAME
cd $CMD_PATH

echo "hello world"
cd ~
git clone --depth 1 https://github.com/elastic/elasticsearch.git 
cd elasticsearch
./gradlew localDistro
./gradlew :distribution:archives:linux-tar:assembl

# tree -L 3
ls -al build/distribution/local/elasticsearch-8.15.0-SNAPSHOT
cd build/distribution/local/
tar cf elasticsearch-8.15.0-SNAPSHOT.tar elasticsearch-8.15.0-SNAPSHOT
ls -al  
file elasticsearch-8.15.0-SNAPSHOT.tar
cp elasticsearch-8.15.0-SNAPSHOT.tar ~/
cd ~/elasticsearch
file build/distribution/local/elasticsearch-8.15.0-SNAPSHOT.tar
file ~/elasticsearch-8.15.0-SNAPSHOT.tar