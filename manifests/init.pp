class some_module (
  Optional[String] $username,
  Sensitive $password = Sensitive(lookup({ 'name' => 'bnsiis::password' })),
  Optional[Array] $binaries,
  Optional[Boolean] $enable_web_deploy,
) {
  contain ::some_module::network
  contain ::some_module::user
  contain ::some_module::preinstall
  contain ::some_module::service

  Class['::some_module::network']
  -> Class['::some_module::user']
  -> Class['::some_module::preinstall']
  -> Class['::some_module::service']
}
