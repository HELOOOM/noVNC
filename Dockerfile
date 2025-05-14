FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    novnc \
    websockify \
    xfce4 \
    x11vnc \
    wget \
    supervisor \
    net-tools && \
    apt-get clean

WORKDIR /app

COPY . /app

EXPOSE 6080

CMD ["./utils/launch.sh", "--vnc", "localhost:5901"]
