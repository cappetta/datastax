#!/bin/bash
# This bootstraps Puppet on CentOS 7.x
# It has been tested on CentOS 7.0 64bit

set -e

REPO_URL="http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm"
EPEL_URL="http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi

# dependency on wget
yum install -y wget

# Install puppet labs repo
echo "Configuring PuppetLabs repo..."
repo_path=$(mktemp)
epel_repo_path=$(mktemp)
wget --output-document="${repo_path}" "${REPO_URL}"
wget --output-document="${epel_repo_path}" "${EPEL_URL}"
rpm -i "${repo_path}"
rpm -i "${epel_repo_path}"

# Install Puppet...
echo "Installing puppet"
yum install -y puppet

echo "Puppet installed!"



