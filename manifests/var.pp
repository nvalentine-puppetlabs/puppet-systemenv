define systemenv::var (
  Enum['present','absent'] $ensure                    = 'present',
  Optional[Pattern[/^[a-zA-Z][a-zA-Z0-9_]+/]] $varname = $name,
  Optional[Pattern[/(^\'.*\'$)|(^\"\.*\"$)/]] $value   = undef,
) {
  require systemenv
  
  $target = $systemenv::params::default_env_settings_file
  assert_type(Stdlib::Absolutepath, $target)

  ini_setting { "${varname}=${value}":
    ensure => $ensure,
    path => $target,
    section => '',
    setting => $varname,
    value => $value,
    key_val_separator => '=',
  }
}
