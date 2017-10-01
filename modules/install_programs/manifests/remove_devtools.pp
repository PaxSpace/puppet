class install_programs::remove_devtools {
    $apt_packages = ['arduino','kicad','cmake','kdevelop','gitk','build-essential']

    package { $apt_packages: ensure => absent }
}
