FROM mysql:latest as stocks-db

RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV MYSQL_DATABASE=stocks
ENV MYSQL_ROOT_PASSWORD=password
ENV ACCEPT_EULA=Y
ENV DOCKER_BUILDKIT=0

COPY ./sql /docker-entrypoint-initdb.d/

RUN ["/usr/local/bin/docker-entrypoint.sh", "mysqld", "--datadir", "/initialized-db"]

FROM mysql:latest

COPY --from=stocks-db /initialized-db /var/lib/mysql