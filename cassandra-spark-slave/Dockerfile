FROM cassandra

ENV CASSANDRA_CLUSTER_NAME=mega

COPY spark-supervisor.conf /etc/supervisor/conf.d/
RUN apt-get update && apt-get install -y \
	wget \
	supervisor \
	less \
	vim

RUN mkdir /app
RUN mkdir -p /var/log/supervisor

RUN ["/bin/bash", "-c", "set -o pipefail && wget -O - https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz | tar -xz -C /app"]

CMD ["/bin/bash", "-c", "/usr/bin/supervisord"]

EXPOSE 8080 7000 7001 7199 9042 9160