puppet-systemenv
================

Manage system environment variables. Currently that involves managing entries in /etc/environment.

# Contact
Nathan Valentine - nathan@puppetlabs.com | nrvale0@gmail.com

# Usage site.pp
    include systemenv
    
    $environment_variables = {
      'foo' =>  { ensure => present, value => '\'bar\'', },
      'bar' => { ensure => present, value => '\'baz\'', },
      'baz' => { ensure => absent, value => '\'qqq\'', },
    }
    
    create_resources(systemenv::var, $environment_variables)


# Usage hiera
This is a sample hiera file:

    ---
    classes:
      - systemenv

    systemenv::var:
      'foo':
        ensure: present
        value: "'bar'"
      'bar':
        ensure: present
        value: "'baz'"
      'baz':
        ensure: absent
        value: "'qqq'"


This is a sample site.pp:

    hiera_include('classes')

    node default {
      $mySystemenvVar = hiera('systemenv::var', {})
      create_resources(systemenv::var, $mySystemenvVar)
    }


# API
    define systemenv::var (
      $ensure = 'present',
      $varname = $name,
      $value = undef,
    ) {

# ToDo
* add support for .d directories?


