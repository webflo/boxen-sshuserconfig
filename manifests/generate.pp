class sshuserconfig::generate($user = undef) {
    $unix_user = $user ? {
      undef   => $::luser,
      default => $user
    }
    #TODO: make an OS exception here or an variable, so Linux users can set /home as path for user folders
    #$rootgroup = $osfamily ? {
    #        'Solaris'          => 'wheel',
    #        /(Darwin|FreeBSD)/ => 'wheel',
    #        default            => 'root',
    #    }
    $ssh_dir = "/Users/${unix_user}/.ssh"
    $entry_dest = "${ssh_dir}/config.d/${alias}"
    $ssh_config_file = "${ssh_dir}/config"
    $ssh_config_dir = "${ssh_dir}/config.d"
    # that regenerates our .ssh/config

    $header = template('sshuserconfig/header.erb')

    exec { "generate_config":
      command => "(echo '${header}'; cat ${ssh_config_dir}/*) > ${ssh_config_file}",
      provider => "shell",
      subscribe => File[$ssh_config_dir],
    }
}
