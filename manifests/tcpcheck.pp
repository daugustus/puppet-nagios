define nagios::tcpcheck(
	$args	=	"",
	$contact_groups	= "",
	$description	=	"",
	$ensure	=	"present",
	$host	= $::fqdn,
	$plugin	= "check_tcp",
	$templates = "",
	$service_groups = "",
){

    @@nagios_service{"${name}":
      contact_groups  =>  "${contact_groups}",
      check_command =>  "${plugin}!${args}",
      ensure  =>  $ensure,
      host_name =>  "${host}",
      service_description => "${description}",
      servicegroups =>  "${service_groups}",
      target  =>  "/etc/nagios/conf.d/service_${name}.cfg",
      use     =>  "${templates}",
    }
}
