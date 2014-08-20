class nagios::service {
 
#    exec { 'fix-permissions':
#        command     => "find /etc/nagios4/conf.d -type f -name '*cfg' | xargs chmod +r",
#        refreshonly => true,
#    } ->
 
	service {'nagios':
  	ensure 	=> running,
    enable  => true,
    require => Class[ 'nagios::install' ],
	}
}
