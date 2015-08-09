#!/usr/bin/env bash


# Install puppet modules before launching puppet scripts - these can be executed locally as the application user
puppet module install puppetlabs-stdlib
puppet module install puppetlabs-motd
puppet module install stankevich-python
