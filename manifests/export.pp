class nagios::export{
	@@nagios_host { "${::fqdn}" :
  	ensure              => present,
    address             => $::ipaddress,
    use                 => 'host-alarm-l9,host-check-l9',
    check_command       => 'check-host-alive',
    hostgroups          => 'all-servers',
    target              => "/etc/nagios/conf.d/${::fqdn}.cfg",
  }
  @@nagios_service { "${::fqdn}_check-load":
		ensure              => present,
    use                 => 'svc-alarm-l9,svc-check-l9',
    host_name           => "${::fqdn}",
    service_description => 'Current Load',
    check_command       => 'check_nrpe!check_load',
    target              => "/etc/nagios/conf.d/${::fqdn}.cfg",
  }
	@@nagios_service { "${::fqdn}_check-disk":
  	ensure              => present,
    use                 => 'svc-alarm-l9,svc-check-l9',
    host_name           => "${::fqdn}",
    service_description => 'hda1 disk usage',
    check_command       => 'check_nrpe!check_hda1',
    target              => "/etc/nagios/conf.d/${::fqdn}.cfg",
  }
}
