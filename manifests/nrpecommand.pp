define nagios::nrpecommand(
	$args						=	undef,
	$command				=	$name,
	$description		=>	undef,
	$ensure					=	undef,
	$host						=	"${::fqdn}",
	$nagios_conf_d	=	$nagios::params::nagios_confd,
	$nrpe_template	=	'check_command',
	$plugin					=	$name,
	$sudo						=	false,
	$sudo_user			=	undef,
){

	file { "${nagios::params::nrpe_cfg_dir}/nrpe-${title}.cfg":
    content => template("nagios/nrpe-${nrpe_template}.cfg.erb"),
		description	=>	$description,
    ensure  => $ensure,
    group   => $nagios::client::nrpe_group,
    mode    => '0640',
    notify  => Service['nrpe'],
  	owner   => 'root',
  }	
}
