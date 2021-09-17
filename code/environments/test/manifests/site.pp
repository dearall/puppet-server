node default {
  notify { 'default node':
    message => "[test] environment. no match your node, this is default node.",
  }
}

class { 'ntp':
  servers => ['192.168.10.2','cn.ntp.org.cn'],
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


