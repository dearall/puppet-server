class user::virtual
{
  @user { 'seven':
    ensure     => present,
    managehome => true,
    shell      => '/bin/bash',
  }
  
  @user { 'jeck':
    ensure     => present,
    managehome => true,
    shell      => '/bin/bash',
  }
  
  @user { 'lucy':
    ensure     => present,
    managehome => true,
    shell      => '/bin/bash',
  }
}

