FROM ubuntu:latest

RUN mkdir -p /mcserver
COPY serverFiles /mcserver/
RUN apt-get update -y && apt-get install openjdk-8-jdk -y
WORKDIR /mcserver/
RUN echo eula=true > eula.txt && ls && sh Install.sh
RUN useradd -g root mc && chown -R mc:root /mcserver && chmod -R 770 /mcserver

CMD ["/mcserver/ServerStart.sh"]