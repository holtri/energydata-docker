# energydata-docker

This repository contains materials to setup the infrastructure and to run the examples for the workshop on _Energy Status Data - Time Series Storage and Analytics_.

# Infrastructure

The setup consists of several containers which are deployed into one (or more) host servers. The only prerequisite is to install docker and docker-compose on the host server. The [Getting Started Guide](https://docs.docker.com/get-started/) gives you a kick-start with docker. Also, with the current configuration, the recommended hardware requirement for the full setup is 32 GB RAM available on the host system.

The containers including networking are setup through [docker-compose](https://docs.docker.com/compose/). The infrastructure, i.e., the containers to run, their configuration, the network between the containers and port bindings, is described completely by docker-compose.yml.

So, to setup the infrastructure, first clone this repository to the host system and then run docker-compose inside the cloned repository (i.e., where the docker-compose.yml resides).

```bash
$ sudo docker-compose up -d
```

If you have a fresh docker installation, this will first pull the required images from dockerhub. Then, containers are instantiated according to [docker-compose.yml](docker-compose.yml). The setup includes a Single-Node Kafka broker (including a connect standalone), zookeeper, schema registry, a Spark-Master, a two-node Cassandra cluster with co-located Spark workers and a container running Jupyter Notebook. The nodes are able to talk to each other on all ports in a local network. The port bindings from each container to the outside world are specified in the [docker-compose.yml](docker-compose.yml).

Some of the container images used in this setup are tailored to our use-case. You can find the docker files for the containers in the directories docker-cassandra-spark-slave, docker-kafka, and docker-spark-master. The images are also [published to dockerhub](https://hub.docker.com/u/holtri/).

# Running the Examples

This repository includes example code for an end-to-end use case. The use-case bases on two data sets: weather data and power generation from https://data.open-power-system-data.org. Jupyter notebooks to preprocess the data are available in the directory (data-preprocessing). To prepare the data, download the following two data sets into the folder data-preprocessing

[weather_data_GER_2016.csv](https://data.open-power-system-data.org/weather_data/)

[time_series_15min_stacked.csv](https://data.open-power-system-data.org/time_series/) (make sure you download the \_stacked.csv!)

Then run the two jupyter notebooks [data-preprocessing/kafka_preprocess_generation.ipynb](data-preprocessing/kafka_preprocess_generation.ipynb) and [data-preprocessing/kafka_preprocess_weatherdata.ipynb](data-preprocessing/kafka_preprocess_weatherdata.ipynb)

which outputs several csv files (please see the notebooks on how they are generated):

* de_generation.csv
* wind_trimmed.csv
* solar_trimmed.csv
* weather_sensor.csv
* weather_station.csv

## Kafka

## Cassandra

## Spark

# Jupyter Notebook

Workaround for volume permissions to make notebooks persistent:

```bash
/energydata-docker$ mkdir jupyter-data
/energydata-docker$ sudo chmod 777 jupyter-data/
`

See also: https://github.com/jupyter/docker-stacks/issues/114
