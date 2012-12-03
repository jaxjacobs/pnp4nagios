maintainer "Bigpoint GmbH"
maintainer_email "sebgrewe@bigpoint.net"
license "Apache 2.0"
description "Install and configures pnp4nagios for Icinga/Nagios"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.0"

# Default settings used in configuration options below
attribute "pnp4nagios/config/rrdbase",
          :display_name => "pnp4nagios Perfdata Path",
          :description => "Base path where pnp4nagios will place performance data rrd graphs.",
          :default => "/var/lib/pnp4nagios/perfdata/"

depends "apt"
depends "yum"
depends "apache2"
