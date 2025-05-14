#!/bin/bash
# Démarre un bureau distant avec noVNC

# Démarrer l'environnement de bureau
startxfce4 &

# Lancer le serveur VNC
x11vnc -display :0 -forever -nopw -quiet -rfbport 5901 &

# Lancer noVNC
/app/utils/novnc_proxy --vnc localhost:5901
