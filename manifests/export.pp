class nagios::export{
	@@nagios_host { "${::fqdn}" :
  	ensure              => present,
    address             => $::ipaddress,
    use                 => 'host-alarm-l9,host-check-l9',
    check_command       => 'check-host-alive',
    hostgroups          => 'all-servers',
    target              => "/etc/nagios/conf.d/${::fqdn}.cfg",
  }
}
