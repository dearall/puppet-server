node default {
  notify { 'default node':
    message => "not match your node, this is default node",
  }
}

include localtime
