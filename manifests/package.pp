class puppet::package (
  $agent  = $puppet::params::agent_package,
  $server = $puppet::params::master_package,
) inherits puppet::params {

  $packages = union([$agent], [$server])
  @package { $packages: }

  if $puppet::agent::manage_repos {
    include puppet::package::repository
  }

  if $::operatingsystem == 'gentoo' {
    include puppet::package::gentoo
  }
}
