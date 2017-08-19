FROM alpine

COPY supervisor.conf /etc/supervisor.conf

RUN mkdir /app

RUN apk update && apk add \
	openjdk8-jre \
	wget 

RUN wget -O - https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz | tar -xz -C /app

RUN apk update && apk add \
	bash \
	python \
	py-pip

RUN pip install supervisor
	
EXPOSE 8080

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor.conf"]


