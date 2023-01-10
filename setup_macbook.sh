#!/usr/bin/env bash

sudo gem install puppet
sudo FACTER_WHOAMI=$(/usr/bin/whoami) puppet apply macbook.pp --modulepath=modules