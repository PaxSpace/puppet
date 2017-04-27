class install_programs::install_design {
    $apt_packages = ['blender','inkscape','openscad','pinta']

    package { $apt_packages: ensure => latest, require => Exec['apt-get update']}
}
