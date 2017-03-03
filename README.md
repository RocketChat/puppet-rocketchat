# rocket

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with rocket](#setup)
    * [What rocket affects](#what-rocket-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with rocket](#beginning-with-rocket)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview
This Puppet module installs Rocket.Chat. It can also install and configure reverse proxy(Apache/Nginx) and if you want can manage firewall.

## Module Description

If applicable, this section should have a brief description of the technology
the module integrates with and what that integration enables. This section
should answer the questions: "What does this module *do*?" and "Why would I use
it?"

If your module has a range of functionality (installation, configuration,
management, etc.) this is the time to mention it.

You can use this module to automate some steps in installation and configuration of Rocket.Chat. For now this module will download and prepare everythink to run Rocket.Chat instance. It can setup reverse proxy of your choice(Apache/Nginx) and configure firewall.

## Setup

### What rocket affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Beginning with rocket

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

Just 'include rocket' to install Rocket.Chat with managed firewall and Nginx as reverse proxy.

## Usage

'''puppet
class { 'rocket':
  reverse_proxy => 'apache', or 'none' if you don't want to install any
  manage_firewall=> true
}
'''
## Limitations

This is where you list OS compatibility, version compatibility, etc.
