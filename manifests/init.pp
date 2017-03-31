# == Class: mysql
#
# === Examples
#
#  class { 'mysql':
#    mysqld_bind_address    => '127.0.0.1',
#  }
#
# === Authors
#
# Aneesh C <aneeshchandrasekharan@gmail.com>
#

class mysql (
  $package_name                  = $::mysql::params::package_name,
  $configfile                    = $::mysql::params::configfile,
  $template                      = 'mysql/configfile.erb',
  $mysqld_datadir                = undef,
  $mysqld_socket                 = undef,
  $mysqld_symbolic_links         = undef,
  $mysqld_user                   = undef,
  $mysqld_bind_address           = undef,
  $mysqld_local_infile           = undef,
  $mysqld_pid_file               = undef,
  $mysqld_port                   = undef,
  $mysqld_basedir                = undef,
  $mysqld_tmpdir                 = undef,
  $mysqld_lc_messages_dir        = undef,
  $mysqld_skip_external_locking  = undef,
  $mysqld_key_buffer             = undef,
  $mysqld_key_buffer_size        = undef,
  $mysqld_max_allowed_packet     = undef,
  $mysqld_thread_stack           = undef,
  $mysqld_thread_cache_size      = undef,
  $mysqld_myisam_recover         = undef,
  $mysqld_myisam_recover_options = undef,
  $mysqld_query_cache_limit      = undef,
  $mysqld_query_cache_size       = undef,
  $mysqld_log_error              = undef,
  $mysqld_expire_logs_days       = undef,
  $mysqld_max_binlog_size        = undef,
  $mysqld_safe_log_error         = undef,
  $mysqld_safe_pid_file          = undef,
  $mysqld_safe_socket            = undef,
  $mysqld_safe_nice              = undef,
  $client_port                   = undef,
  $client_socket                 = undef,
  $mysqldump_quick               = undef,
  $mysqldump_quote_names         = undef,
  $mysqldump_max_allowed_packet  = undef,
  $isamchk_key_buffer            = undef,
  $includedir                    = [],
) inherits ::mysql::params {
  package { $package_name: ensure => installed }
  file { $configfile:
    require => package[$package_name],
    backup  => '.backup',
    content => template($template),
  }
  if $::osfamily == 'RedHat' {
    service { 'mysqld':
      require => package[$package_name],
      enable  => true,
    }
  }
}
