#!/usr/bin/env bash
set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
echo $PROJECT_NAME
cd $CMD_PATH

echo "hello world"
cd ~
git clone -b dev_240511_01 --depth 1 https://github.com/es366/10003-data-elasticsearch.git elasticsearch
cd elasticsearch
./gradlew localDistro
./gradlew :distribution:archives:linux-tar:assembl

# tree -L 3
ls -al build/distribution/local/

cd build/distribution/local/

tar cf elasticsearch-8.13.4-SNAPSHOT.tar elasticsearch-8.13.4-SNAPSHOT
cd elasticsearch-8.13.4-SNAPSHOT/bin
timeout 600 ./elasticsearch & 
sleep 180
curl 127.0.0.1:9200 -v
cd ..
cd ..
ls -al  
file elasticsearch-8.13.4-SNAPSHOT.tar
cp elasticsearch-8.13.4-SNAPSHOT.tar ~/
cd ~/elasticsearch
file build/distribution/local/elasticsearch-8.13.4-SNAPSHOT.tar
file ~/elasticsearch-8.13.4-SNAPSHOT.tar
