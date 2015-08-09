class setupGraphite(){


  # preferred symlink syntax
  file { '/usr/share/jmxtrans.yaml':
     ensure => 'link',
     target => '/usr/share/jmxtrans.yaml',
  }


}

