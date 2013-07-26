class systemenv::params {
  case $::operatingsystem {
    'ubuntu': {
      $default_env_settings_file = '/etc/environment'
    }
    default: {fail("OS ${::operatingsystem} not supported!")}
  }
}
