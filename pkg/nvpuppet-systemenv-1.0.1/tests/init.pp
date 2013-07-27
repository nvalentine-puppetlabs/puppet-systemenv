include systemenv

$environment_variables = {
  'foo' =>  { ensure => present, value => '\'bar\'', },
  'bar' => { ensure => present, value => '\'baz\'', },
  'baz' => { ensure => absent, value => '\'qqq\'', },
}

create_resources(systemenv::var, $environment_variables)
