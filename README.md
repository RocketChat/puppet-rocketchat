# rocket
[![Build Status](https://travis-ci.org/RocketChat/puppet-rocket.svg?branch=master)](https://travis-ci.org/RocketChat/puppet-rocket)

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
This Puppet module installs Rocket.Chat. It will also install MongoDB and configure it. For now only SystemD init files are provided.

## Module Description

You can use this module to automate some steps in installation and configuration of Rocket.Chat. For now this module will download and prepare everythink to run Rocket.Chat instance.

## Setup

### What rocket affects

### Beginning with rocket

Just `include rocket` to install Rocket.Chat with managed firewall and Nginx as reverse proxy.

## Usage

```ruby
class { 'rocket':
  root_url    => 'www.yourcompanydomain.com',
  port        => '80',
  destination => '/opt/'
} 
```

## Limitations

Module is tested on Debian 7, 8 and Ubuntu 14.04 and 16.04
