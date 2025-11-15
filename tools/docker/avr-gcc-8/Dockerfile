# ===== builder =====
FROM debian:bookworm AS build

ARG BINUTILS_VER=2.32
ARG GCC_VER=8.5.0
ARG AVR_LIBC_VER=2.1.0
ARG PREFIX=/opt/avr
ARG TARGET=avr

ENV PATH="${PREFIX}/bin:${PATH}"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential bison flex libgmp-dev libmpfr-dev libmpc-dev texinfo \
    libisl-dev wget ca-certificates python3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

# binutils (avr)
RUN wget -O binutils-${BINUTILS_VER}.tar.xz https://ftp.gnu.org/gnu/binutils/binutils-${BINUTILS_VER}.tar.xz && \
    tar -xf binutils-${BINUTILS_VER}.tar.xz && \
    mkdir -p build-binutils && cd build-binutils && \
    ../binutils-${BINUTILS_VER}/configure --target=${TARGET} --prefix=${PREFIX} \
      --disable-nls --disable-werror && \
    make -j"$(nproc)" && make install && \
    cd /tmp && rm -rf build-binutils binutils-${BINUTILS_VER} binutils-${BINUTILS_VER}.tar.xz

# gcc 8.x (stage1: gcc + libgcc, bez headers)
RUN wget -O gcc-${GCC_VER}.tar.xz https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VER}/gcc-${GCC_VER}.tar.xz && \
    tar -xf gcc-${GCC_VER}.tar.xz && \
    cd gcc-${GCC_VER} && ./contrib/download_prerequisites && cd .. && \
    mkdir -p build-gcc && cd build-gcc && \
    ../gcc-${GCC_VER}/configure --target=${TARGET} --prefix=${PREFIX} \
      --enable-languages=c --disable-nls --disable-libssp --disable-libquadmath \
      --disable-shared --disable-threads --with-dwarf2 --without-headers && \
    make -j"$(nproc)" all-gcc && \
    make -j"$(nproc)" all-target-libgcc && \
    make install-gcc && make install-target-libgcc && \
    cd /tmp && rm -rf build-gcc gcc-${GCC_VER} gcc-${GCC_VER}.tar.xz

# avr-libc (hlavičky + C knihovna pro AVR)
RUN wget -O avr-libc-${AVR_LIBC_VER}.tar.bz2 \
      https://download.savannah.gnu.org/releases/avr-libc/avr-libc-${AVR_LIBC_VER}.tar.bz2 && \
    tar -xf avr-libc-${AVR_LIBC_VER}.tar.bz2 && \
    cd avr-libc-${AVR_LIBC_VER} && \
    ./configure --build=$(./config.guess) --host=${TARGET} --prefix=${PREFIX} && \
    make -j"$(nproc)" && make install && \
    cd /tmp && rm -rf avr-libc-${AVR_LIBC_VER} avr-libc-${AVR_LIBC_VER}.tar.bz2

# malý sanity check
RUN avr-gcc --version && avr-gcc -mmcu=atmega328p -dumpmachine

# ===== runtime =====
FROM debian:bookworm-slim

ARG PREFIX=/opt/avr
ENV PATH="${PREFIX}/bin:${PATH}"

# volitelně: nástroje pro flash/kompilaci
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    avrdude make ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build ${PREFIX} ${PREFIX}

# finální ověření verze v image
RUN avr-gcc --version | head -n1

VOLUME ["/opt/src/"]
WORKDIR /opt/src/
CMD ["/bin/bash"]
