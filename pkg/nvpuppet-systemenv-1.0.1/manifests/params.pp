class systemenv::params {
  case $::osfamily {
    'debian','redhat': { $default_env_settings_file = '/etc/environment' }
    default: {fail("OS ${::operatingsystem} not supported!")}
  }
}
