class install_programs::remove_gui {
    $apt_packages = ['gnome','gdm3']
    
    package { $apt_packages: ensure => absent, require => Exec['apt-get update']}
}
