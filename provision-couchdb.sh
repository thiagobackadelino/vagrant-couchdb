#!/usr/bin/env bash

locale-gen UTF-8

cd /opt && \

sudo apt-get update && \
sudo apt-get install software-properties-common -y && \
sudo add-apt-repository ppa:couchdb/stable -y && \
sudo apt-get update && \
#sudo apt-get remove couchdb couchdb-bin couchdb-common -yf && \
sudo apt-get install couchdb -y && \
#curl localhost:5984 && \ 
#sudo service couchdb restart && \
#curl localhost:5984 && \
sudo service couchdb stop  && \
sudo chown -R couchdb:couchdb /usr/lib/couchdb /usr/share/couchdb /etc/couchdb /usr/bin/couchdb && \
sudo chmod -R 7777 /usr/lib/couchdb /usr/share/couchdb /etc/couchdb /usr/bin/couchdb && \
sudo service couchdb restart  && \
cd /vagrant_data/couchdb-config/ && \
cp  -f -u default.ini /etc/couchdb/ && \ 
sudo service couchdb start