Description
===========

Install and configures pnp4nagios for Icinga/Nagios

Requirements
============

## Platform:

* Rhel
* Centos
* Debian

## Cookbooks:

* apt
* yum
* apache2

Attributes
==========

<table>
  <tr>
    <td>Attribute</td>
    <td>Description</td>
    <td>Default</td>
  </tr>
  <tr>
    <td><code>node['pnp4nagios']['version']</code></td>
    <td>Version to be installed, only used for Debian backports right now.</td>
    <td><code>0.6.12-1~bpo60+1</code></td>
  </tr>
  <tr>
    <td><code>node['pnp4nagios']['config']['rrdbase']</code></td>
    <td>Base path where pnp4nagios will place performance data rrd graphs.</td>
    <td><code>/var/lib/pnp4nagios/perfdata/</code></td>
  </tr>
  <tr>
    <td><code>node['pnp4nagios']['htpasswd']['file']</code></td>
    <td>htpasswd file used by pnp4nagios virtual host for authentication.</td>
    <td><code>/etc/pnp4nagios/htpasswd.users</code></td>
  </tr>
  <tr>
    <td><code>node['pnp4nagios']['setup']</code></td>
    <td>Various configuration settings, please see attributes file for details.</td>
    <td><code>See attributes file.</code></td>
  </tr>
</table>

Recipes
=======

## rrdcached

Install and configures a simple default rrdcache installation.

## rrdcached::_dependencies

Installs required software.

## rrdcached::_install_rhel

Installs pnp4nagios on RHEL based systems.

## rrdcached::_install_debian

Installs pnp4nagios on Debian based systems.

## rrdcached::_add_repositories_rhel

Installs pnp4nagios on RHEL based systems.

## rrdcached::_add_repositories_debian

Installs pnp4nagios on Debian based systems.

## rrdcached::_configure

Configures pnp4nagios for both RHEL and Debian.

Poem
====

The code was willing,
It considered your request,
But the chips were weak.

License and Author
==================

Author:: Bigpoint GmbH (<sebgrewe@bigpoint.net>)

Copyright:: 2012, Bigpoint GmbH

License:: Apache 2.0
