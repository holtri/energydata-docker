FROM debian:stretch-backports

COPY supervisord.conf /etc/supervisor/conf.d/

RUN apt-get update && apt-get install -y \
	openjdk-8-jre \
	wget

RUN mkdir /app
	
RUN ["/bin/bash", "-c", "set -o pipefail && wget -O - https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz | tar -xz -C /app"]

RUN apt-get update && apt-get install -y \
	supervisor \
	less \
	vim
		
CMD ["/bin/bash", "-c", "/usr/bin/supervisord"]

EXPOSE 8080
