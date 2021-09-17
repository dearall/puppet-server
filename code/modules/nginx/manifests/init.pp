class nginx {

  package { 'nginx':
    ensure    => installed,
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    subscribe => File['nginx.conf'],
  }

  file {'nginx.conf':
    ensure  => present,
    path    => '/etc/nginx/nginx.conf',
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('nginx/nginx.conf.erb'),
  }
}
