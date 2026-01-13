FROM ubuntu:latest

ENV CLOUDNET_EULA_ACCEPTED=true

WORKDIR /opt/build

RUN apt-get update && \
    apt-get install -y wget openjdk-25-jre screen unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /opt/entrypoint.sh

RUN chmod 777 /opt/entrypoint.sh

EXPOSE 5520/udp

CMD ["/opt/entrypoint.sh"]