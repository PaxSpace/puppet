#!/bin/bash

puppet apply --verbose --modulepath=$PWD/modules/ $PWD/manifests/
