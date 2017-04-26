class install_programs::remove_design {
    $apt_packages = ['blender','inkscape','openscad','netfabb','pinta']

    package { $apt_packages: ensure => absent, require => Exec['apt-get update']}
}
