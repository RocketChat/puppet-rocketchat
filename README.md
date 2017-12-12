# puppet-rocketchat
[![Build Status](https://travis-ci.org/RocketChat/puppet-rocketchat.svg?branch=master)](https://travis-ci.org/RocketChat/puppet-rocketchat)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with rocketchat](#setup)
    * [What rocketchat affects](#what-rocketchat-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with rocketchat](#beginning-with-rocketchat)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview
This Puppet module installs Rocket.Chat. It will also install MongoDB and configure it. For now only SystemD init files are provided.

## Module Description

You can use this module to automate some steps in installation and configuration of Rocket.Chat. For now this module will download and prepare everythink to run Rocket.Chat instance.

## Setup

### What rocketchat affects

### Beginning with rocketchat

Just `include rocketchat` to install Rocket.Chat with managed firewall and Nginx as reverse proxy.

## Usage

```ruby
class { 'rocketchat':
  root_url    => 'http://www.yourcompanydomain.com',
  port        => '80',
  destination => '/opt'
}
```

In the case of multiple Rocket.Chat instances, the instance identification of each should be an address that can be connected by the others.
If the host IP Rocket.Chat runs on cannot be used as is from other hosts (or a different naming is preferred), the instance\_ip parameter will need to be changed accordingly.
Not doing so will cause syncing issues (typing information, audio and desktop notifications, etc).

## Limitations

Module is tested on Debian 7, 8 and Ubuntu 14.04 and 16.04
