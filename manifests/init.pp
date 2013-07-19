class sshuserconfig {
  $ssh_dir = "/Users/${::luser}/.ssh"
  $ssh_config_file = "${ssh_dir}/config"
  file { $ssh_config_file :
    owner => $::luser
  }
  
  file { $ssh_dir:
    ensure => "directory",
	mode => 0700
  }
  
  file { "${ssh_dir}/config.d":
    ensure => "directory",
	mode => 0700
  }
  #TODO: if the directory did not exist yet, its our first run. Therefore backup the config first, so the user
  # does not lose anything  
}
