class nagios::client(
    $nrpe_log_facility				= 'daemon',
    $nrpe_pid_file						= '/var/run/nrpe/nrpe.pid',
    $nrpe_server_port					= '5666',
    $nrpe_server_address			= undef,
    $nrpe_user								= 'nrpe',
    $nrpe_group								= 'nrpe',
    $nrpe_allowed_hosts				= '127.0.0.1, 172.30.100.135',
		$nrpe_cfg_dir							= '/etc/nrpe.d',
    $nrpe_dont_blame_nrpe			= '1',
    $nrpe_command_prefix			= '/usr/bin/sudo',
    $nrpe_command_timeout			= '60',
    $nrpe_connection_timeout	= '300',
) inherits ::nagios::params {
 
	package { [ 'nrpe', 'nagios-plugins-all', 'nsca-client' ]:
  	ensure      => present,
  }
  service { 'nrpe':
  	ensure      => running,
    enable      => true,
    require     => Package[ 'nrpe', 'nagios-plugins-all' ],
  }

	file{"/etc/nagios/nrpe.cfg":
		ensure	=>	present,
		content	=>	template("nagios/nrpe.cfg.erb"),
		owner	=>	"root",
		group	=>	"nrpe",
		mode	=>	"640",
		notify	=>	Service["nrpe"],
	}
	
	# include custom plugins
	nagios::client::brplugins
}
