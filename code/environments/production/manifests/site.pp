node default {
  notify { 'default node':
    message => "[production] environement, not match your node, this is default node.",
  }
}

include localtime

node 'dnsmasq.sansovo.org' {
  class { 'ntp':
    servers    => ['ntp.aliyun.com','cn.ntp.org.cn','127.127.1.0'],
    interfaces => ['127.0.0.1', '192.168.10.2'],
    restrict   => [
      '-4 default notrap nomodify nopeer noquery',
      '-6 default notrap nomodify nopeer noquery',
      '127.0.0.1',
      '-6 ::1',
      #允许这个网段的对时请求
      '192.168.10.0 mask 255.255.255.0 nomodify',

      #允许上层ntp server的所有权限      
      'ntp.aliyun.com',
      'cn.ntp.org.cn'
    ],
  }
}

node /\w+\.sansovo\.org$/ {
  class { 'ntp':
    servers    => ['192.168.10.2 prefer','cn.ntp.org.cn'],
    restrict   => [
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
}

