node default {
  notify { 'default node':
    message => "[production] environement, not match your node, this is default node.",
  }
}

include localtime

node 'dnsmasq.sansovo.org' {
  class { 'ntp':
    servers => ['ntp.aliyun.com','cn.ntp.org.cn'],
    interfaces => ['127.0.0.1', '192.168.10.2'],
  }
}

node /\w+\.sansovo\.org$/ {
  class { 'ntp':
    servers => ['192.168.10.2','cn.ntp.org.cn'],
  }
}

