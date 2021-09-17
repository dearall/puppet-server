class test {
  file { '/tmp/filebucket':
    ensure  => file,
    content => 'Welcome to LinuxTone!', 
  }

  file { 'filebucket':
    path    => '/tmp/bucket',
    ensure  => file,
    content => 'Welcome To LinuxTone!',
  }
}
