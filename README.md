# energydata-docker

Setup for the workshopon _Energy Status Data - Time Series Storage and Analytics_.

# Infrastructure

Running
```bash
$ docker-compose up -d
```
sets up a Single-Node Kafka Broker (including zookeeper, schema registry, connect) a Spark-Master and a two-node Cassandra cluster with co-located Spark workers.

# Jupyter Notebook

Workaround for volume permissions to make notebooks persistent:

```bash
/energydata-docker$ mkdir jupyter-data
/energydata-docker$ sudo chmod 777 jupyter-data/
`

See also: https://github.com/jupyter/docker-stacks/issues/114
