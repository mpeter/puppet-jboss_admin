# == Defines jboss_admin::local_cache
#
# A local cache
#
# === Parameters
#
# [*batching*]
#   If enabled, the invocation batching API will be made available for this cache.
#
# [*indexing*]
#   If enabled, entries will be indexed when they are added to the cache. Indexes will be updated as entries change or are removed.
#
# [*indexing_properties*]
#   Properties to control indexing behaviour
#
# [*jndi_name*]
#   The jndi-name to which to bind this cache instance.
#
# [*module*]
#   The module whose class loader should be used when building this cache's configuration.
#
# [*start*]
#   The cache start mode, which can be EAGER (immediate start) or LAZY (on-demand start).
#
# [*statistics_enabled*]
#   If enabled, statistics will be collected for this cache
#
#
define jboss_admin::resource::local_cache (
  $server,
  $batching                       = undef,
  $indexing                       = undef,
  $indexing_properties            = undef,
  $jndi_name                      = undef,
  $module                         = undef,
  $start                          = undef,
  $statistics_enabled             = undef,
  $ensure                         = present,
  $path                           = $name
) {
  if $ensure == present {

  

    $raw_options = { 
      'batching'                     => $batching,
      'indexing'                     => $indexing,
      'indexing-properties'          => $indexing_properties,
      'jndi-name'                    => $jndi_name,
      'module'                       => $module,
      'start'                        => $start,
      'statistics-enabled'           => $statistics_enabled,
    }
    $options = delete_undef_values($raw_options)

    jboss_resource { $path:
      ensure  => $ensure,
      server  => $server,
      options => $options
    }


  }

  if $ensure == absent {
    jboss_resource { $path:
      ensure => $ensure,
      server => $server
    }
  }


}