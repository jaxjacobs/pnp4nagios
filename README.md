Description
===========

Install and configures pnp4nagios for Icinga/Nagios

Requirements
============

## Platform:

* debian
* centos
* rhel

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
    <td>`node['pnp4nagios']['config']['rrdbase']`</td><td>Base path where pnp4nagios will place performance data rrd graphs.</td><td>`/var/lib/pnp4nagios/perfdata/`</td>
  </tr>
</table>

Recipes
=======

*No recipes defined*

License and Author
==================

Author:: Bigpoint GmbH (<sebgrewe@bigpoint.net>)

Copyright:: 2012, Bigpoint GmbH

License:: Apache 2.0
