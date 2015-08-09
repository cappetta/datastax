# declare datastax opscenter role
class datastax::opscenter {
# todo: declare install script in puppet manifest.


  file {
    '/etc/hosts':
      ensure  => 'file',
      source  => 'puppet:///modules/cappetta-datastax/config.etc.hosts',
      path    => '/etc/hosts',
      owner   => 'root',
      group   => 'root',
      mode    => '0744', # Use 0700 if it is sensitive
      notify  => Exec['Install OpsCenter'],
  }


  exec {
    "Install OpsCenter":
      command => '/vagrant/puppry/modules/cappetta-datastax/files/install.opscenter.sh',
      refreshonly => true
  }

}