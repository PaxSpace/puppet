class install_programs::install_gui {
    include 'install_programs::install_browsers'
    include 'install_programs::install_devtools'
    include 'install_programs::install_design' 

    $apt_packages = ['default_jre','gnome','gdm3']
    
    package { $apt_packages: ensure => latest, require => Exec['apt-get update']}
}
