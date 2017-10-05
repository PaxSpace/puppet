#!/bin/bash

mkdir -p /opt
cd /opt

apt-get update
apt-get install -y puppet git coreutils

git clone https://github.com/PaxSpace/puppet.git --branch dev --depth 1

cd puppet

./runAgent.sh
