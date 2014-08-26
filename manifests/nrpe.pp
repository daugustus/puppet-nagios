class nagios::nrpe {
 
	package { [ 'nrpe', 'nagios-plugins-all', 'nsca-client' ]:
  	ensure      => present,
  }
  service { 'nrpe':
  	ensure      => running,
    enable      => true,
    require     => Package[ 'nrpe', 'nagios-plugins-all' ],
  }
}
