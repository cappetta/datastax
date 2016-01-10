class cappetta-datastax::profile_minecraft  {
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
  class { 'minecraft':
    source     => '1.8.8',
    heap_size  => 4096,
    difficulty => 2,
    motd       => 'The MineCraft Server',
    ops        => [ 'cappetta', 'supermanchris','supermancammy']
  }->
  minecraft::plugin { 'dynmap':
    source => 'http://dev.bukkit.org/media/files/757/982/dynmap-1.9.1.jar'
  }->
  minecraft::plugin { 'worldedit':
    source => 'http://addons.curse.cursecdn.com/files/880/435/worldedit-bukkit-6.1.jar'
  }->
  file { '/opt/minecraft/eula.txt':
  content    => 'eula=true',
  notify     => Service['minecraft']
  }
  exec {'cp additional plugins':
    command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/minecraft/*jar /opt/minecraft/plugins/'}

}