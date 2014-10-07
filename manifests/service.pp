class nagios::service {
 
	# exported resources don't set permissions properly
  exec{"fix-exported-resources-permissions":
  	command     => "find /etc/nagios/conf.d -type f -name '*cfg' | xargs chmod +r",
    refreshonly => true,
  } ->
	service{"nagios":
  	ensure	=>	running,
    enable	=>	true,
    require	=>	Class[ 'nagios::install' ],
	}
	service{"nsca":
		ensure	=>	running,
		enable	=>	true,
		require	=>	Class[ 'nagios::install' ],
	}
}
