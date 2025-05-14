# Utilise une image de base légère avec Xfce et VNC
FROM dorowu/ubuntu-desktop-lxde-vnc

# Met à jour et installe les dépendances nécessaires
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python3 \
    python3-pip \
    novnc \
    websockify \
    xfce4 \
    x11vnc \
    wget \
    supervisor \
    net-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copie le projet noVNC dans le conteneur
COPY . /app
WORKDIR /app

# Ouvre le port standard pour VNC
EXPOSE 8080

# Commande de démarrage : lance noVNC
CMD ["./utils/launch.sh", "--vnc", "localhost:5901"]
