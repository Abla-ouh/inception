FROM debian:buster

RUN apt-get update \
    && apt-get install -y mariadb-server

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/db.sh /
RUN chmod +x /db.sh
# WHILE true; do sleep 1; done
CMD ["/db.sh"]
