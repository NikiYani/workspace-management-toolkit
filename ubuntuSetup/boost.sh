#!/bin/bash

version="1_74_0"

wget -q --no-check-certificate "https://boostorg.jfrog.io/artifactory/main/release/1.74.0/source/boost_$version.tar.gz" && \
	tar xfz "boost_$version.tar.gz" && \
	cd boost_$version && \
	./bootstrap.sh && \
	./b2 -d0 -q --without-mpi --without-graph --without-graph_parallel --without-test install && \
	cd .. && rm -f boost_$version.tar.gz && \
	find boost_$version -type f | xargs -d '\n' rm -f && find boost_$version -type d | tac | xargs -d '\n' rmdir