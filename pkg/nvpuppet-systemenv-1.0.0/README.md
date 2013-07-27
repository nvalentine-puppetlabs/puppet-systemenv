puppet-systemenv
================

Manage system environment variables. Currently that involves
managing entries in /etc/environment.

# Contact
Nathan Valentine - nathan@puppetlabs | nrvale0@gmail.com

# Usage
    include systemenv
    
    $environment_variables = {
      'foo' =>  { ensure => present, value => '\'bar\'', },
      'bar' => { ensure => present, value => '\'baz\'', },
      'baz' => { ensure => absent, value => '\'qqq\'', },
    }
    
    create_resources(systemenv::var, $environment_variables)

# API
    define systemenv::var (
      $ensure = 'present',
      $varname = $name,
      $value = undef,
    ) {

# ToDo
* add support for .d directories?

