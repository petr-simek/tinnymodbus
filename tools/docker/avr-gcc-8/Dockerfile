FROM fedora:42

# copr plugin
RUN dnf -y install 'dnf-command(copr)' && \
    dnf -y copr enable rezso/HDL && \
    dnf -y update

# tady zůstává přesně to, co chceš
RUN dnf -y install avr-gcc-8 avr-libc && \
    dnf clean all

VOLUME "/opt/src/"
WORKDIR "/opt/src/"
CMD ["/bin/bash"]
