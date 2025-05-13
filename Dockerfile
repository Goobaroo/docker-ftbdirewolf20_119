# syntax=docker/dockerfile:1

FROM openjdk:18.0.2-jdk-buster

LABEL version="1.13.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Presents Direwolf20 1.19"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/e8/e846e5c8f32c16bc4203dde90745168f78fe906cdb0d658293a8e7517f4913fc.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTB-Direwolf20-1.19:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Presents Direwolf20 1.19 v1.13.1 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]