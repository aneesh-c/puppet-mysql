class mysql::params {
  if $::osfamily == 'RedHat' {
    $packagename_default = [ 'mysql-server' ]
    $configfile = '/etc/my.cnf'
  }
  elsif $::osfamily == 'Debian' {
    if $::operatingsystem == 'Ubuntu' {
      case $::operatingsystemrelease {
        /^12.*/: {
          $packagename_default = [ 'mysql-server', 'libapache2-mod-auth-mysql' ]
          $configfile = '/etc/mysql/my.cnf'
        }
        /^14.*/: {
          $packagename_default = [ 'mysql-server', 'libapache2-mod-auth-mysql' ]
          $configfile = '/etc/mysql/my.cnf'
        }
        /^16.*/: {
          $packagename_default = [ 'mysql-server' ]
          $configfile = '/etc/mysql/mysql.conf.d/mysqld.cnf'
        }
        /^18.*/: {
          $packagename_default = [ 'mysql-server' ]
          $configfile = '/etc/mysql/mysql.conf.d/mysqld.cnf'
        }
        default: {
          $packagename_default = [ 'mysql-server', 'libapache2-mod-auth-mysql' ]
          $configfile = '/etc/mysql/my.cnf'
        }
      }
    }
    elsif $::operatingsystem == 'Debian' {
      case $::operatingsystemrelease {
        /^7.*/: {
          $packagename_default = [ 'mysql-server', 'libapache2-mod-auth-mysql' ]
          $configfile = '/etc/mysql/my.cnf'
        }
        /^8.*/: {
          $packagename_default = [ 'mysql-server' ]
          $configfile = '/etc/mysql/my.cnf'
        }
        /^9.*/: {
          $packagename_default = [ 'mysql-server' ]
          $configfile = '/etc/mysql/my.cnf'
        }
        default: {
          $packagename_default = [ 'mysql-server', 'libapache2-mod-auth-mysql' ]
          $configfile = '/etc/mysql/my.cnf'
        }
      }
    }
  }
}
