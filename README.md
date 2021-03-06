VMware Fusion Cookbook
======================
[![Cookbook Version](https://img.shields.io/cookbook/v/vmware-fusion.svg)][cookbook]
[![Build Status](https://img.shields.io/travis/RoboticCheese/vmware-fusion-chef.svg)][travis]
[![Code Climate](https://img.shields.io/codeclimate/github/RoboticCheese/vmware-fusion-chef.svg)][codeclimate]
[![Coverage Status](https://img.shields.io/coveralls/RoboticCheese/vmware-fusion-chef.svg)][coveralls]

[cookbook]: https://supermarket.chef.io/cookbooks/vmware-fusion
[travis]: https://travis-ci.org/RoboticCheese/vmware-fusion-chef
[codeclimate]: https://codeclimate.com/github/RoboticCheese/vmware-fusion-chef
[coveralls]: https://coveralls.io/r/RoboticCheese/vmware-fusion-chef

A Chef cookbook for installing VMware Fusion.

Requirements
============

This cookbook consumes the dmg cookbook to support installing OS X packages.

Usage
=====

Either add the default recipe to your run_list or use the included resource in
a recipe of your own.

Recipes
=======

***default***

Installs VMware Fusion with optional license key and/or package source
attributes.

Attributes
==========

***default***

An optional license key can be passed in to be configured during the Chef run:

    default['vmware_fusion']['license'] = nil

An optional path to a VMWare Fusion .dmg file can be provided to install
instead of downloading the package from VMware's site.

    default['vmware_fusion']['source'] = nil

Resources
=========

***vmware_fusion***

A parent resource that wraps the app and config resources.

Syntax:

    vmware_fusion 'default' do
      license 'abc123'
      source '/path/to/vmware.dmg'
      action :install
    end

Actions:

| Action       | Description                   |
|--------------|-------------------------------|
| `:install`   | Install and configure the app |
| `:remove`    | Uninstall the app             |

Attributes:

| Attribute  | Default        | Description                            |
|------------|----------------|----------------------------------------|
| license    | `nil`          | An optional license key                |
| source     | `nil`          | An optional path to a VMware .dmg file |
| action     | `:install`     | Action(s) to perform                   |

***vmware_fusion_app***

Used to manage the installation of the VMware Fusion app.

Syntax:

    vmware_fusion_app 'default' do
      source '/path/to/vmware.dmg'
      action :install
    end

Actions:

| Action     | Description       |
|------------|-------------------|
| `:install` | Install the app   |
| `:remove`  | Uninstall the app |

Attributes:

| Attribute  | Default        | Description                            |
|------------|----------------|----------------------------------------|
| source     | `nil`          | An optional path to a VMware .dmg file |
| action     | `:install`     | Action(s) to perform                   |

***vmware_fusion_config***

An execute resource customized to handle the configuration of VMware Fusion
through its included initialization script.

Syntax:

    vmware_fusion_config 'default' do
      license 'abc123'
      action :create
    end

Actions:

| Action    | Description       |
|-----------|-------------------|
| `:create` | Configure the app |

Attributes:

| Attribute  | Default   | Description             |
|------------|-----------|-------------------------|
| license    | `nil`     | An optional license key |
| action     | `:create` | Action(s) to perform    |

Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for the new feature; ensure they pass (`rake`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

License & Authors
=================
- Author: Jonathan Hartman <j@p4nt5.com>

Copyright 2015-2016, Jonathan Hartman

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
