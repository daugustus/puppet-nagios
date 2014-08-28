define nagios::nrpecheck(
	$ensure					=	undef,
	$plugin					=	$name,
	$command				=	$name,
	$description		= "needs description",
	$args						=	false,
	$templates			=	undef,
	$service_group	=	undef,
	$host						=	"${::fqdn}",
	$nagios_conf_d	=	$nagios::params::nrpe_cfg_dir,
){

	nagios::client::nrpe_file{"${name}":
  	sudo		=>	true,
		args		=>	"${args}",
  	ensure	=>	$ensure,
	}
	@@nagios_service{"${host}-${name}":
		ensure  =>  present,
		host_name =>  "${host}",
		use     =>  "${templates}",
    service_description => "${description}",
		check_command =>  "check_nrpe!${::ipaddress}!${plugin}!10",
		target  =>  "${nagios_conf_d}/service_nrpe_${name}_${host}.cfg"
	}
}
