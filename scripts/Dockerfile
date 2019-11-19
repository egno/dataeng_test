FROM yandex/clickhouse-client

RUN apt-get update && apt-get install mysql-client -y 

RUN mkdir /app
WORKDIR /app

ADD . .

ENTRYPOINT ["/bin/bash"]