FROM debian:jessie
MAINTAINER Julian Haupt <julian.haupt@hauptmedia.de>

ENV	DEBIAN_FRONTEND noninteractive

# install required packges
RUN	apt-get update -qq && \
	apt-get install -y mysql-client perl curl && \
	apt-get clean autoclean && \
	apt-get autoremove --yes && \
	rm -rf /var/lib/{apt,dpkg,cache,log}/

# install mysqltuner
RUN	curl -sL -o /usr/local/bin/mysqltuner http://mysqltuner.pl && \
	chmod +x /usr/local/bin/mysqltuner

CMD ["/usr/local/bin/mysqltuner"]
