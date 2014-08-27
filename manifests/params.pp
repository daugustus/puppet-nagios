# Class: nagios::params
#
# Parameters for and from the nagios module.
#
class nagios::params {

  $libdir = $::architecture ? {
    'x86_64' => 'lib64',
    'amd64'  => 'lib64',
     default => 'lib',
  }

  # The easy bunch
  $nagios_service = 'nagios'
  $nagios_user    = 'nagios'
  # nrpe
  $nrpe_service   = 'nrpe'
  $nrpe_cfg_file  = '/etc/nagios/nrpe.cfg'
  $nrpe_command   = '$USER1$/check_nrpe -H $HOSTADDRESS$'
  $nrpe_options   = '-t 15'

  case $::operatingsystem {
    'RedHat', 'Fedora', 'CentOS', 'Scientific': {
      $nrpe_package       = [ 'nrpe', 'nagios-plugins' ]
      $nrpe_user          = 'nrpe'
      $nrpe_group         = 'apache'
      $nrpe_pid_file      = hiera('nagios::params::nrpe_pid_file','/var/run/nrpe.pid')
      $nrpe_cfg_dir       = hiera('nagios::params::nrpe_cfg_dir','/etc/nrpe.d')
      $plugin_dir         = hiera('nagios::params::plugin_dir',"/usr/${libdir}/nagios/plugins")
      $pid_file           = hiera('nagios::params::pid_file','/var/run/nagios.pid')
      $megaclibin         = '/usr/sbin/MegaCli'
    }
    'Gentoo': {
      $nrpe_package       = [ 'net-analyzer/nrpe' ]
      $nrpe_package_alias = 'nrpe'
      $nrpe_user          = 'nagios'
      $nrpe_group         = 'nagios'
      $nrpe_pid_file      = '/run/nrpe.pid'
      $nrpe_cfg_dir       = '/etc/nagios/nrpe.d'
      $plugin_dir         = "/usr/${libdir}/nagios/plugins"
      $pid_file           = '/run/nagios.pid'
      $megaclibin         = '/opt/bin/MegaCli'
      # No package splitting in Gentoo
      @package { 'net-analyzer/nagios-plugins':
        ensure => installed,
        tag    => $nagios_plugins_packages,
      }
    }
    default: {
      $nrpe_package       = [ 'nrpe', 'nagios-plugins' ]
      $nrpe_user          = 'nrpe'
      $nrpe_group         = 'nrpe'
      $nrpe_pid_file      = hiera('nagios::params::nrpe_pid_file','/var/run/nrpe.pid')
      $nrpe_cfg_dir       = hiera('nagios::params::nrpe_cfg_dir','/etc/nagios/nrpe.d')
      $plugin_dir         = hiera('nagios::params::plugin_dir','/usr/libexec/nagios/plugins')
      $pid_file           = hiera('nagios::params::pid_file','/var/run/nagios.pid')
      $megaclibin         = '/usr/sbin/MegaCli'
      @package { $nagios_plugins_packages:
        ensure => installed,
        tag    => $name,
      }
    }
  }

}

