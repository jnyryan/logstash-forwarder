#!/bin/bash

####################
# Prerequisites

apt-get update
apt-get install -y make curl git 

#####################
# Build and install logstash-forwarder 
sudo apt-get install -y golang
sudo apt-get install -y ruby1.9.1-dev
sudo gem install fpm

git clone git://github.com/elasticsearch/logstash-forwarder.git
cd logstash-forwarder
go build
make deb
sudo dpkg -i logstash-forwarder_0.3.1_amd64.deb

#####################
# Copy certs
cp /vagrant/etc/pki/* /etc/pki
cp /vagrant/etc/logstash-forwarder.conf /opt/logstash-forwarder/logstash-forwarder.conf
logstash-forwarder -config /opt/logstash-forwarder/logstash-forwarder.conf

####################
# Build & Package Tools
sudo apt-get install -y packaging-dev
ssh-keygen -t rsa

exit 

gpg --import < C888BC06.asc

pbuilder-dist trusty create

bzr whoami "John Ryan <jnyryan@gmail.com>"
bzr launchpad-login jnyryan

echo "" >> ~/.bashrc
echo export DEBFULLNAME="John Ryan" >> ~/.bashrc
echo export DEBEMAIL="jnyryan@gmail.com" >> ~/.bashrc
source .bashrc

tar -cvzf logstash-forwarder_0.3.1.tar.gz logstash-forwarder
bzr dh-make logstash-forwarder 0.3.1 logstash-forwarder-0.3.1.tar.gz
cd logstash-forwarder
bzr commit -m "Initial commit of Debian packaging."
bzr builddeb -- -us -uc
# to rebuild
bzr builddeb -- -nc -us -uc
bzr builddeb -S
cd ../build-area
dput ppa:jnyryan/logstash-forwarder logstash-forwarder_0.3.1-1_source.changes




# http://evanhazlett.com/2013/08/logstash-and-kibana-via-docker/
#docker run -d --name ls1 -v /var/log:/var/log -p 50514:514 -p 59200:9200 -p 59292:9292 -p 59300:9300 arcus/logstash
#docker run -d -e ES_HOST=0.0.0.0 -e ES_PORT=59300 -p 50080:80 arcus/kibana

#sudo cat /var/lib/docker/devicemapper/mnt/e069ac90d21671a281a03dc2b05b14ad777b49d4c752c1299ec0b4a9bf1804c2/rootfs/opt/logstash.conf

#docker run -i -t base /bin/bash
#echo "*.* @@0.0.0.0:50514" >> /etc/rsyslog.d/50-default.conf


#docker run -d arcus/elasticsearch
#docker run -d -p 60514:514 -p 59200:9200 -p 59292:9292 -p 59300:9300 arcus/logstash
#docker run -d -e ES_HOST=0.0.0.0 -e ES_PORT=59300 arcus/logstash

#docker run -d -e ES_HOST=127.0.0.1 -e ES_PORT=9200 arcus/kibana

exit

#####################
# Fetch and start a container running logstash (1.4.2), elasticsearch (1.1.1) and Kibana 3 (3.0.1), simply
docker run -d \
  --name logstash \
  -p 514:514 \
  -p 9200:9200 \
  -p 9292:9292 \
  pblittle/docker-logstash



# cd /vagrant && mkdir certs && cd certs
# openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt

# docker build -t forwarder .


