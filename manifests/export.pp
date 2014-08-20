class nagios::export{
	@@nagios_host { $::hostname :
  	ensure              => present,
    address             => $::ipaddress,
    use                 => 'generic-host',
    check_command       => 'check-host-alive',
    hostgroups          => 'all-servers',
    target              => "/etc/nagios/conf.d/${::hostname}.cfg",
  }
  @@nagios_service { "${::hostname}_check-load":
		ensure              => present,
    use                 => 'generic-service',
    host_name           => $::hostname,
    service_description => 'Current Load',
    check_command       => 'check_nrpe!check_load',
    target              => "/etc/nagios/conf.d/${::hostname}.cfg",
  }
	@@nagios_service { "${::hostname}_check-disk":
  	ensure              => present,
    use                 => 'generic-service',
    host_name           => $::hostname,
    service_description => 'hda1 disk usage',
    check_command       => 'check_nrpe!check_hda1',
    target              => "/etc/nagios/conf.d/${::hostname}.cfg",
  }
}
