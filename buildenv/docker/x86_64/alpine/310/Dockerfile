FROM alpine:3.10

# Install required OS tools

# Adding openjdk10 for bootjdk
# Adding libxrandr-dev for Xrandr.h
# Adding fontconfig-dev for fontconfig.h
# Adding libunwind-dev for -lunwind
# Adding libexecinfo-dev for -lexecinfo
# Adding libexecinfo for backtrace, backtrace_symbols
# Adding linux-headers for linux/magic.h
# Adding libdwarf for -ldwarf
# Adding elfutils-dev for -lelf
# Adding findutils for xargs gnu variant
RUN apk update \
  && apk add --no-cache \
    autoconf \
    ca-certificates \
    ccache \
    cmake \
    openjdk10 \
    gcc \
    g++ \
    cpio \
    file \
    git \
    findutils \
    libdwarf \
    libdwarf-dev \
    elfutils-dev \
    musl-dev \
    numactl-dev \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    libxt-dev \
    libxtst-dev \
    libxrandr-dev \
    fontconfig-dev \
    libunwind-dev \
    libexecinfo-dev \
    libexecinfo \
    linux-headers \
    make \
    nasm \
    unzip \
    wget \
    zip \
    vim \
    cups-dev \
    alsa-lib-dev \
    freetype-dev \
    bash \
    tar \
    openssh \
    grep

# Download and setup freemarker.jar to /root/freemarker.jar
RUN cd /root \
  && wget https://sourceforge.net/projects/freemarker/files/freemarker/2.3.8/freemarker-2.3.8.tar.gz/download -O freemarker.tgz \
  && tar -xzf freemarker.tgz freemarker-2.3.8/lib/freemarker.jar --strip=2 \
  && rm -f freemarker.tgz


WORKDIR /root
