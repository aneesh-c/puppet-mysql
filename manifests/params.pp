class mysql::params {
  if $::osfamily == 'RedHat' {
    $package_name = [ 'mysql-server' ]
    $configfile = '/etc/my.cnf'
  }
  elsif $::osfamily == 'Debian' {
    case $::operatingsystemrelease {
      /^12.*/: {
        $package_name = [ 'mysql-server', 'libapache2-mod-auth-mysql', 'php5-mysql' ]
        $configfile = '/etc/mysql/my.cnf'
      }
      /^14.*/: {
        $package_name = [ 'mysql-server', 'libapache2-mod-auth-mysql', 'php5-mysql' ]
        $configfile = '/etc/mysql/my.cnf'
      }
      /^16.*/: {
        $package_name = [ 'mysql-server', 'php-mysql' ]
        $configfile = '/etc/mysql/mysql.conf.d/mysqld.cnf'
      }
      default: {
        $package_name = [ 'mysql-server', 'libapache2-mod-auth-mysql', 'php5-mysql' ]
        $configfile = '/etc/mysql/my.cnf'
      }
    }
  }
}
