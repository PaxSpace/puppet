#!/bin/bash

mkdir -p /var/log/puppet_agent

puppet apply --verbose --modulepath=$PWD/modules/ -e "class{'base_computer': }"
puppet apply --verbose --modulepath=$PWD/modules/ -e "class{'base_computer::update_modules': }"
puppet apply --verbose --modulepath=$PWD/modules $PWD/manifests > /var/log/puppet_agent/`date +\%Y\%m\%d-\%H\%M`.log 2>&1
