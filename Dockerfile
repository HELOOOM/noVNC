FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Mise à jour + installation progressive pour éviter les erreurs
RUN apt-get update && apt-get upgrade -y && \
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
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copie du script de lancement (tu dois l’avoir ajouté dans utils/)
COPY utils/launch.sh /utils/launch.sh
RUN chmod +x /utils/launch.sh

# Port d’écoute
EXPOSE 8080

# Commande par défaut
CMD ["/utils/launch.sh"]
