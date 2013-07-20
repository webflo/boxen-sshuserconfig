SSH Config (alias) Boxen Puppet Module
============================

Basically started to derive from Jimdo/puppet-sshuserconfig,  but in the end i rather completly rewritten (sadly)

This module lets you maintain your .ssh/config a sain way, using the debian-art .ssh/config.d/<alias> folder
Every entry in .ssh/config.d/* will be used to generate the .ssh/config file automatically - so it does not change the way ssh works,
but rather generates the config file ( instead of concatenating).

This makes maintaing entrys much easier and convinient.

This module is perfectly compatible with Boxen
Usage
---------
# this does setup the .ssh config, backups your old one and uses it as an entry in .ssh/config.d/config_old
incldue sshuserconfig 

sshuserconfig::host {
"aliasname":
remote_hostname => "somehost",
remote_username => 'root',
remote_port => '22',
} 	

Requirements
------------

* OSX (for now) 

Manifests
---------

* init.pp : us it like "includ sshuserconfig" to setup you .ssh folder correctly. 
* host.pp : use this to generate a new entry
 
ToDo
---------
* remove the OSX requirement and make it Linux compatible ( bascically just abstract the default user folder - thats it)