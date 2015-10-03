# msmtp-cookbook

## Synopsis

This is a [Chef](http://www.opscode.com/chef) cookbook for deploying [msmtp](http://msmtp.sourceforge.net/doc/msmtp.html). So far it is tested on CentOS (5,6,7).

## Requirements

### Miscellaneous

* [Chef Solo](http://wiki.opscode.com/display/chef/Chef+Solo) or [Chef Server](http://wiki.opscode.com/display/chef/Chef+Server) environment

### Chef dependencies

* No dependencies yet

## Recipes

### msmtp::default

Install MSMTP.

### msmtp::default

Default installation (package).

### msmtp::source

Installation from sources.

### msmtp::package

Installation from package.

### msmtp::config

Run configuration providers.

### msmtp::sasl

Download SASL certs.

### msmtp::no_postfix

Disable postfix daemon at all.

## Usage

### Adding the cookbook

Add it to your Berkshelf `Berksfile`:

    cookbook 'msmtp', github: 'merqlove/chef-msmtp'

Or clone the cookbook into your local chef repository:

    git clone https://github.com/merqlove/chef-msmtp.git

### Configuration

The cookbook provides a couple attributes that help you to configure ssmtp via a role's `default_attributes`.

Here's an example role:

	name 'mail_server'
	description "Installs mail related applications."
	# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
	run_list(
	  'recipe[msmtp]'
	)
	# Attributes applied if the node doesn't have it set already.
	default_attributes(
	  'msmtp' => {
      'install_method' => 'package',
      'binary' => '/usr/bin/msmtp',
	    'host' => 'smtp.gmail.com',
			'port' => 587,
			'domain' => 'somehost.com',
			'username' => 'noreply@somehost.com',
			'from' => 'noreply@somehost.com',
			'password' => 'afsasffafa',
			'default' => true,
			"accounts" => {
        "someuser": {
          "host": "smtp.gmail.com",
          "port": "587",
          "domain": "somehost2.com",
          "username": "noreply@somehost2.com",
          "from": "noreply@somehost2.com",
          "password": "sfsgsgsdgdsdg"
        },
      },
	  },
	)
	# Attributes applied no matter what the node has set already.
	#override_attributes(
	#)

For a full list of attributes please consult `./attributes/default.rb`.

## Development

* Source hosted at [GitHub](https://github.com/merqlove/chef-msmtp)
* Report issues/Questions/Feature requests on [GitHub](https://github.com/merqlove/chef-msmtp/issues) as well

Pull requests are very welcome! Make sure your patches are well tested.

## License

Copyright © 2013-2014, Alexander Merkulov  
Copyright © 2009-2013, Sander van Zoest  
Copyright © 2012, Mike Adolphs

Licensed under the Apache License, Version 2.0 (the "License");  
you may not use this file except in compliance with the License.  
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software  
distributed under the License is distributed on an "AS IS" BASIS,  
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  
See the License for the specific language governing permissions and  
limitations under the License.
