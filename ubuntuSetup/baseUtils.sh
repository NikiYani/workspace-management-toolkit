#!/bin/bash

apt-get install --no-install-recommends -y \
		gcc-10 \
		g++-10 \
		build-essential \
		cmake \
		make \
		automake \
		ninja-build \
		gdb \
		git \
		wget \
		docker \
		docker-compose \
		docker.io \
		bleachbit \
		deborphan \
		rar \
		zip \
		openssl \
		qtbase5-dev \
		libgmock-dev \
		libgtest-dev \
		libp11-kit-dev \
		libengine-gost-openssl1.1 \
		libqt5sql5-sqlite \
		libqt5serialport5-dev \
		libarchive-dev \
		libprotobuf-dev \
		libcurl4-openssl-dev \
		libusb-1.0-0-dev \
		libbenchmark-dev \
		libpugixml-dev \
		libseccomp-dev \
		libssl-dev \
		libtool

apt-get autoremove -y && apt-get clean