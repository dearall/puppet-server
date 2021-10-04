node default {
  notify { 'default node':
    message => '[test] environment. no match your node, this is default node.',
  }
}

include localtime

class { 'ntp':
  servers  => ['192.168.10.2 prefer','cn.ntp.org.cn'],
  restrict => [
    # By default, exchange time with everybody, but don't allow configuration.
    '-4 default notrap nomodify nopeer noquery',
    '-6 default notrap nomodify nopeer noquery',
    '127.0.0.1',
    '-6 ::1',

    #允许这个网段的对时请求
    '192.168.10.0 mask 255.255.255.0 nomodify',

    #允许上层ntp server的所有权限
    '192.168.10.2'
  ],
}


node 'test.sansovo.org'  {

  include user::virtual
  include user::dba
  include user::sysadmin

  include nginx

  include test

  if tagged('/tmp/filebucket') {
    notify { 'so path tag': }
  }

  if tagged('filebucket') { 
    notify { 'so filebucket tag': }
  }
  if tagged('test') {
    notify { 'so class name tag': }
  }
}


