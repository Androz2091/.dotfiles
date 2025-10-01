# syntax=docker/dockerfile-upstream:master-labs

###############################################################################
# Build args                                                                  #
###############################################################################
# Default Ubuntu Docker tag
ARG VERSION=latest


###############################################################################
# CTF container
###############################################################################
FROM ubuntu:$VERSION
SHELL ["/bin/bash", "-c"]

# Prepare timezone settings => necessary for installing packages further down
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Enable APT package caching
RUN rm -f /etc/apt/apt.conf.d/docker-clean && \
    echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache

# Install base packages
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        bash-completion \
        binwalk \
        bsdmainutils \
        build-essential \
        ca-certificates \
        clang \
        curl \
        elfutils \
        file \
        gdb \
        gdb-multiarch \
        gdbserver \
        git \
        iproute2 \
        less \
        lld \
        ltrace \
        mono-complete \
        nasm \
        netcat-openbsd \
        ninja-build \
        nmap \
        parallel \
        patchelf \
        python3 \
        python3-pip \
        ruby \
        ruby-dev \
        qemu-user \
        socat \
        strace \
        sudo \
        tini \
        tmux \
        tor \
        unicorn \
        valgrind \
        vim \
	nano \
        wget \
        z3

# Install Python packages
RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked \
    . /etc/os-release && \
    if [[ ${VERSION_CODENAME} = "noble" ]]; then export BREAK="--break-system-packages"; fi && \
    pip3 install ${BREAK} -U \
        angr \
        capstone \
        decomp2dbg \
        keystone-engine \
        meson \
        pipenv \
        pwntools \
        ropper \
        scapy \
        urlbuster \
        volatility3 \
        z3

RUN gem install \
        one_gadget \
        seccomp-tools \
        zsteg

# Bash stuff
RUN sed -i "s/#force_color_prompt/force_color_prompt/g" ~/.bashrc

# pwninit
ADD --chmod=0744 https://github.com/io12/pwninit/releases/latest/download/pwninit /usr/bin/pwninit

# pwndbg, gef, peda
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    --mount=type=cache,target=/root/.cache/pip,sharing=locked \
    --mount=type=tmpfs,target=/tmp \
    git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef.git /tmp/gdb-peda-pwndbg-gef && \
    /tmp/gdb-peda-pwndbg-gef/install.sh

# decomp2dbg
RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked \
    --mount=type=tmpfs,target=/tmp \
    git clone https://github.com/mahaloz/decomp2dbg.git /tmp/decomp2dbg && \
    . /etc/os-release && \
    if [[ ${VERSION_CODENAME} = "noble" ]]; then export BREAK="--break-system-packages"; fi && \
    pip3 install ${BREAK} -U /tmp/decomp2dbg && \
    cp /tmp/decomp2dbg/d2d.py /root/.d2d.py && \
    echo "source /root/.d2d.py" >> /root/.gdbinit

# zardus/ctf-tools
#ADD --link --keep-git-dir=true https://github.com/zardus/ctf-tools.git /root/ctf-tools
#RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
#    --mount=type=cache,target=/var/lib/apt,sharing=locked \
#    sed -i "s/python/python3/g" /root/ctf-tools/bin/manage-tools && \
#    /root/ctf-tools/bin/manage-tools -s setup

# Define the directory to mainly work in
VOLUME /ctf
WORKDIR /ctf

# Entrypoint/cmd
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/bin/bash"]
