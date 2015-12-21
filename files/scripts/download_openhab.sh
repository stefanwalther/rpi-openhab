#!/bin/bash


wget --quiet --no-check-certificate --no-cookies -O /tmp/distribution-runtime.zip https://bintray.com/artifact/download/openhab/bin/distribution-$OPENHAB_VERSION-runtime.zip
wget --quiet --no-check-certificate --no-cookies -O /tmp/distribution-addons.zip https://bintray.com/artifact/download/openhab/bin/distribution-$OPENHAB_VERSION-addons.zip
wget --quiet --no-check-certificate --no-cookies -O /tmp/demo-openhab.zip https://bintray.com/artifact/download/openhab/bin/distribution-$OPENHAB_VERSION-demo.zip

wget --quiet --no-check-certificate --no-cookies -O /tmp/hyperic-sigar-1.6.4.tar.gz http://downloads.sourceforge.net/project/sigar/sigar/1.6/hyperic-sigar-1.6.4.tar.gz

rm -rf /opt/openhab
mkdir -p /opt/openhab/addons-available
mkdir -p /opt/openhab/logs
mkdir -p /opt/openhab/lib
tar -zxf /tmp/hyperic-sigar-1.6.4.tar.gz --wildcards --strip-components=2 -C /opt/openhab hyperic-sigar-1.6.4/sigar-bin/lib/*
unzip -q -d /opt/openhab /tmp/distribution-runtime.zip
unzip -q -d /opt/openhab/addons-available /tmp/distribution-addons.zip
unzip -q -d /opt/openhab/demo-configuration /tmp/demo-openhab.zip
chmod +x /opt/openhab/start.sh
mv /opt/openhab/configurations /etc/openhab
ln -s /etc/openhab /opt/openhab/configurations
