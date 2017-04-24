#!/bin/bash

puppet apply --modulepath=$PWD/modules/ $PWD/manifests/
