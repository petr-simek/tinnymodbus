FROM fedora:43

# COPR plugin
RUN dnf -y install dnf-plugins-core

# Aktivace správné větve COPR (viz výpis „Available repositories“)
RUN dnf -y copr enable rezso/HDL fedora-43-x86_64

RUN dnf -y update

# Sem vaše balíčky. Názvy mohou být jiné než v EL (ověřte: dnf search)
RUN dnf -y install avr-gcc avr-libc   # nebo balík(y) z COPR, které potřebujete

VOLUME "/opt/src/"
WORKDIR "/opt/src/"
CMD ["/bin/bash"]