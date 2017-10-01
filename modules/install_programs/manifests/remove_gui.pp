class install_programs::remove_gui {
    $apt_packages = ['gnome','gdm3','x11-apps']
    
    package { $apt_packages: ensure => absent }
}
