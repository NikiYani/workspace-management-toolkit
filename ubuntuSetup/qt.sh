#!/bin/bash

sudo cp /etc/apt/sources.list /etc/apt/sources.list~ && \
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list && \
sudo apt update && \

sudo apt install qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools && \
sudo apt-get build-dep qt5-default && \
sudo apt-get install libxcb-xinerama0-dev && \ 

git clone https://code.qt.io/qt/qt5.git && \
cd qt5 && \
git checkout origin/5.15.2 && \

perl init-repository --module-subset=default,-qtwebkit,-qtwebkit-examples,-qtwebengine,-qtsensors,-qtpurchasing,-qtcharts,-qtdatavis3d,-qtgamepad,-qtspeech,-qtlocation && \

cd .. && \
mkdir build && \
cd build && \
../qt5/configure -prefix /opt/Qt5.15.2 -opensource -confirm-license -optimized-qmake -developer-build -nomake examples -nomake tests && \

make -j4 && \
make install

# :/opt/Qt5.15.2/bin$ ./qmake -v
# QMake version 3.1
# Using Qt version 5.15.2 in /opt/Qt5.15.2/lib

# /usr/local/Qt-5.7.1/bin/designer <- Qt-дизайнер
# /usr/local/Qt-5.7.1/bin/assistant <- Qt-ассистент
