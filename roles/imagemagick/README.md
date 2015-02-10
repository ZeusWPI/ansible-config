# Ansible Role For ImageMagick

[![Build Status](http://img.shields.io/travis/crushlovely/ansible-imagemagick.svg?style=flat)](https://travis-ci.org/crushlovely/ansible-imagemagick)
[![Current Version](http://img.shields.io/github/release/crushlovely/ansible-imagemagick.svg?style=flat)](https://galaxy.ansible.com/list#/roles/1180)

This an Ansible role that installs [ImageMagick](http://www.imagemagick.org/) and its dependencies via `apt` on a server running Ubuntu 12.04LTS.

## Installation

``` bash
$ ansible-galaxy install crushlovely.imagemagick
```

## Usage

Once this role is installed on your system, include it in the roles list of your playbook.

``` yaml
---
- hosts: localhost
  roles:
    - { role: crushlovely.imagemagick }
```

## Dependencies

None

## License

MIT
