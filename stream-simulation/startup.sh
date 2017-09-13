#!/bin/bash

docker exec -t -u 0 energydatadocker_broker_1 kafka-topics --zookeeper zookeeper --create --topic generation --partitions 2 --replication-factor 1
docker exec -t -u 0 energydatadocker_broker_1 kafka-topics --zookeeper zookeeper --create --topic generationIngress --partitions 2 --replication-factor 1

docker cp ./stream.cql energydatadocker_node1_1:/
docker exec -t -u 0 energydatadocker_node1_1 cqlsh -e "SOURCE 'stream.cql'"

docker exec -t energydatadocker_jupyter_1 pip install kafka-python
docker cp ./cassandraConnector.properties energydatadocker_broker_1:/
docker exec -t -u 0 energydatadocker_broker_1 nohup ./usr/bin/connect-standalone ./etc/kafka/connect-standalone.properties ./cassandraConnector.properties &

docker cp ./data/ energydatadocker_jupyter_1:/home/jovyan/
docker exec -t -u 0 energydatadocker_jupyter_1 nohup python /home/jovyan/data/stream.py &

