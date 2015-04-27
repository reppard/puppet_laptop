#!/bin/bash
sudo puppet apply --verbose --debug --modulepath=modules manifests/site.pp
