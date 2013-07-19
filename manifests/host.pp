define sshuserconfig::host(  
  $remote_hostname,
  $remote_username,
  $priv_key_name = 'id_rsa',
  $user = undef,
  $remote_port = 22,
) {
	
  $unix_user = $user ? {
    undef   => $::luser,
	default => $user
  }	

  $ssh_dir = "/Users/${unix_user}/.ssh"
  $privkey_path = "${ssh_dir}/$priv_key_name"  
  $alias = "${title}"
  $entry_dest = "${ssh_dir}/config.d/${alias}"


  file { $entry_dest :
    content => "Host ${alias}
  HostName ${remote_hostname}
  Port ${remote_port}
  User ${remote_username}
  IdentityFile ${privkey_path}\n\n"
  }
  #$ssh_config_file = "${ssh_dir}/config"    
}
