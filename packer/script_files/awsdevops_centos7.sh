#!/bin/sh -x

echo **** Installing Pre-Requisite packages ****
sudo yum -y install git wget
sudo yum -y groupinstall "Development Tools"
sudo yum -y install openssl-devel

echo **** Installing Ruby 2.4.6 ****
#wget http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.gz
wget http://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.6.tar.gz
tar xvfvz ruby-2.4.6.tar.gz
cd ruby-2.4.6
sudo ./configure
sudo make
sudo make install

echo **** Update Gem and install Bundler ****
sudo /usr/local/bin/gem update --system
sudo /usr/local/bin/gem install bundler

echo **** Installing R10K ****
sudo /usr/local/bin/gem install r10k

echo **** Installing Puppet ****
sudo rpm -ivh http://yum.puppetlabs.com/el/7Server/PC1/x86_64/puppet-agent-1.10.14-1.el7.x86_64.rpm

echo **** Remove unnecessary files ****
sudo rm -rf /tmp/*
sudo yum clean all
sudo rm -rf /var/cache/yum

echo **** Create puppet temp folder ****
mkdir -p /tmp/packer-puppet-masterless