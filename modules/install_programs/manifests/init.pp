class install_programs {
    $apt_packages = ['less','vim','keepass2','xdotool']
    
    package { $apt_packages: ensure => latest}

    exec { "default_editor" :
        command => "/usr/sbin/update-alternatives --set editor /usr/bin/vim.basic",
        require => Package['vim']
    }
}
