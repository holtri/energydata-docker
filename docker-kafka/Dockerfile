FROM confluentinc/cp-kafka

# setup connector
RUN mkdir /opt/connectors
RUN wget -O  wget -O "/opt/connectors/guava-19.0.jar" http://search.maven.org/remotecontent?filepath=com/google/guava/guava/19.0/guava-19.0.jar
RUN ["/bin/bash", "-c", "set -o pipefail && wget -O - https://github.com/datamountaineer/stream-reactor/releases/download/0.3.0/kafka-connect-cassandra-0.3.0-3.3.0-all.tar.gz | tar -xz -C /opt/connectors/"]

RUN sed -i -e 's:#plugin.path=.*:plugin.path=/usr/share/java/kafka/,/opt/connectors,:g' /etc/kafka/connect-standalone.properties
RUN sed -i -e 's:key.converter.schemas.enable=.*:key.converter.schemas.enable=false:g' /etc/kafka/connect-standalone.properties
RUN sed -i -e 's:value.converter.schemas.enable=.*:value.converter.schemas.enable=false:g' /etc/kafka/connect-standalone.properties
