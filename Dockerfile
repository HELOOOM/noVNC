FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Met à jour le système et installe les dépendances
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    novnc \
    websockify \
    xfce4 \
    x11vnc \
    wget \
    supervisor \
    net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copie le script de lancement (tu dois avoir ce fichier dans ton repo)
COPY utils/launch.sh /utils/launch.sh
RUN chmod +x /utils/launch.sh

# Dossier de travail
WORKDIR /root

# Expose le port VNC (port interne)
EXPOSE 5901

# Commande de démarrage
CMD ["/utils/launch.sh", "--vnc", "localhost:5901"]
