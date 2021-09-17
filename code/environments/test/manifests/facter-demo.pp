$variable = "Welcome To LinuxTone."
file { 'Welcome':
  path    => '/tmp/welcome',
  content => $variable,
}

