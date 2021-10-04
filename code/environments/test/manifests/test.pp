# filebucket 备份
class test {
  file { '/tmp/filebucket':
    ensure  => file,
    content => 'Welcome to LinuxTone!',
  }

  file { 'filebucket':
    ensure  => file,
    path    => '/tmp/bucket',
    content => 'Welcome To LinuxTone!',
  }
}
