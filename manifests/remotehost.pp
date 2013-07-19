define sshuserconfig::remotehost(
  $unix_user,
  $remote_hostname,
  $remote_username,
  $priv_key_name = 'id_rsa',
  $remote_port = 22,
) {

  $ssh_config_dir_prefix = "/home/${unix_user}/.ssh"
  $ssh_config_file = "${ssh_config_dir_prefix}/config"
  $ssh_config_folder = "${ssh_config_dir_prefix}/config.d"
  $entry_name = "${title}"
  $synthesized_privkey_path = "${ssh_config_dir_prefix}/$priv_key_name"

  file { "${$ssh_config_folder}/${$entry_name}" :
    target => $ssh_config_file,
    content => "Host ${title}
  HostName ${remote_hostname}
  Port ${remote_port}
  User ${remote_username}
  IdentityFile ${synthesized_privkey_path}\n\n"
  }
}
