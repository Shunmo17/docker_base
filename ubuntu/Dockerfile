##############################################################################
##                                 Base Image                               ##
##############################################################################
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

# change server for apt-get
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive

# avoid time-zone setting
ARG UBUNTU
RUN if [ "${UBUNTU}" = "18" ]; then \
        apt update \
        && apt install -y tzdata; \
    fi

##############################################################################
##                                  Common                                  ##
##############################################################################
# install ifconfig & ping
RUN apt update && apt install -y \
    iproute2 \
    iputils-ping \
    net-tools \
    terminator \
    nautilus \
    gedit \
    vim \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# install pip (after ver3.4 : pip is installed)
# RUN apt update && apt install -y \
#     wget \
#     && apt clean \
#     && rm -rf /var/lib/apt/lists/* \
#     && wget https://bootstrap.pypa.io/get-pip.py

RUN if [ "${UBUNTU}" = "16" -o "${UBUNTU}" = "18" ]; then \
        apt update && apt install -y python-pip; \
    else apt update && apt install -y python3-pip; \
    fi

## fix terminator error
RUN apt update && apt install -y \
    dbus-x11 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# aiias
RUN echo "source /alias.sh">> ~/.bashrc
