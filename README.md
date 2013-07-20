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
```puppet
# this does setup the .ssh config, backups your old one 
#and uses it as an entry in .ssh/config.d/config_old
incldue sshuserconfig 

# that actually adds a new entry, which will be place under
# ~/.ssh/config.d/aliasname
sshuserconfig::host {
"aliasname":
remote_hostname => "somehost.tld",
remote_username => 'root',
}
```

#you can also set the 
# - priv_key_name
# - remote_port
# - user ( the user this entry should stored for, so the "desti home folder")
Requirements
------------

* OSX (for now) 

Manifests
---------

* init.pp : us it like "includ sshuserconfig" to setup you .ssh folder correctly. 
* host.pp : use this to generate a new entry

Hints
---------
After your first run, your old config gets backuped to config.old and copied as an "alias" to config.d/config_old
You should remove that old config when you have done using sshuserconfig to maintain your entrys one by one

ToDo
---------
- [x] make first-run convinient (backup old config, use old config)
- [ ] remove the OSX requirement and make it Linux compatible ( bascically just abstract the default user folder - thats it)
- [ ] more docs