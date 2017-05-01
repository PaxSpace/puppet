#!/bin/bash

puppet apply --verbose --modulepath=$PWD/modules/ -e "class{'base_computer': }"
puppet apply --verbose --modulepath=$PWD/modules/ -e "class{'base_computer::update_modules': }"
puppet apply --verbose --modulepath=$PWD/modules/ $PWD/manifests/
