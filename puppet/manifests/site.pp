# required packages
package { 'unzip':
  ensure => present,
}

# Setup the EPEL (Extra Repository for Enterprise Linux) package repo
include epel
class { 'epel': }

# Install Python
class { 'python' :
  ensure      => 'present',
  version     => 'python36',
  pip         => 'latest',
  use_epel    => true,
  require     => Class['epel'],
}

# Install AWS CLI (depends on python)
python::pip { 'awscli' :
  ensure        => 'present',
  pkgname       => 'awscli',
  pip_provider  => 'pip3',
  owner         => 'root',
  timeout       => 1800,
  require       => Class['python']
}

# Install Packer
include ::packer

# Download and install Terraform
archive { '/tmp/terraform.zip':
  ensure        => present,
  source        => 'https://releases.hashicorp.com/terraform/0.12.4/terraform_0.12.4_linux_amd64.zip',
  extract       => 'true',
  extract_path  => '/usr/local/bin',
  user          => 0,
  group         => 0,
}

# Install Powerlevel theme for centos user
vcsrepo { '/opt/powerlevel9k':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/Powerlevel9k/powerlevel9k.git',
}

# Configure Oh-My-Zsh for multiple users in one shot and set their shell to zsh
class { 'ohmyzsh': }
ohmyzsh::install { ['root','centos']:
  set_sh  => true
}

file { '/home/centos/.zshrc':
  ensure => 'present',
  source => '/tmp/config_files/.zshrc',
  owner  => 'centos',
  group  => 'centos'
}

# Install Colorls
# TODO - Investigate why pakcage provider gem is not working.
# package { 'colorls':
#   ensure   => 'installed',
#   provider => 'gem',
# }
# workaround as package is not working
exec {'colorls_gem_install':
  command => '/usr/local/bin/gem install colorls'
}

# Install Neofetch
yumrepo { 'konimex-neofetch-epel-7':
  enabled  => 1,
  descr    => 'Neofetch repo',
  baseurl  => 'https://copr-be.cloud.fedoraproject.org/results/konimex/neofetch/epel-7-$basearch/',
  gpgcheck => 0,
}

package {'neofetch':
  ensure => 'installed'
}











