define nagios::tcpcheck(
	$args	=	"",
	$contact_groups	= "undef",
	$description	=	"",
	$ensure	=	"present",
	$nagios_conf_d = ${nagios::params::nagios_conf_d}
	$plugin	= "undef",
	$templates = "",
	$service_groups = "",
){
    @@nagios_service{"${name}":
      contact_groups  =>  "${contact_groups}",
      check_command =>  "check_tcp!${::ipaddress}!10",
      ensure  =>  $ensure,
      host_name =>  "${host}",
      service_description => "${description}",
      servicegroups =>  "${service_groups}",
      target  =>  "${nagios_conf_d}/service_${name}_${host}.cfg",
      use     =>  "${templates}",
    }
}
