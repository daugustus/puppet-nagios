class nagios::plugins{
  include nagios::plugins::send_sns
  include nagios::plugins::check_akka_cluster
}
