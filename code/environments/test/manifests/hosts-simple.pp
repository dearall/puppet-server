host { 'self':
  ensure       => present,
  name         => $fqdn,
  host_aliases => ['puppet', $hostname],
  ip           => $facts['networking']['interfaces']['eth1']['ip'],
}

file { 'motd':
  ensure  => file,
  path    => '/tmp/motd',
  mode    => '0644',
  content => "Welcome to ${hostname},\na ${operatingsystem} island in the sea of ${domain}.\n",
}

