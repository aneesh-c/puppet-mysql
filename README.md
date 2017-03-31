# MySQL Module

## Overview

This module install and configure mysql database server.

## Usage

Default configuration:

```puppet
include mysql
```

Custom configuration:

```puppet
class { 'mysql':
    mysqld_datadir               => '/var/lib/mysql',
    mysqld_socket                => '/var/run/mysqld/mysqld.sock',
    mysqld_user                  => 'mysql',
    mysqld_bind_address          => '127.0.0.1',
    mysqld_local_infile          => '0',
    mysqld_pid_file              => '/var/run/mysqld/mysqld.pid',
    mysqld_port                  => '3306',
    mysqld_basedir               => '/usr',
    mysqld_tmpdir                => '/tmp',
    mysqld_lc_messages_dir       => '/usr/share/mysql',
    mysqld_skip_external_locking => true,
    mysqld_key_buffer            => '16M',
    mysqld_max_allowed_packet    => '16M',
    mysqld_thread_stack          => '192K',
    mysqld_thread_cache_size     => '8',
    mysqld_myisam_recover        => 'BACKUP',
    mysqld_query_cache_limit     => '1M',
    mysqld_query_cache_size      => '16M',
    mysqld_log_error             => '/var/log/mysql/error.log',
    mysqld_expire_logs_days      => '10',
    mysqld_max_binlog_size       => '100M',
    mysqld_safe_log_error        => '/var/log/mysql/mysql.log',
    mysqld_safe_socket           => '/var/run/mysqld/mysqld.sock',
    mysqld_safe_nice             => '0',
    client_port                  => '3306',
    client_socket                => '/var/run/mysqld/mysqld.sock',
    mysqldump_quick              => true,
    mysqldump_quote_names        => true,
    mysqldump_max_allowed_packet => '16M',
    isamchk_key_buffer           => '16M',
    includedir                   => [ '/etc/mysql/conf.d/' ],
}
```

