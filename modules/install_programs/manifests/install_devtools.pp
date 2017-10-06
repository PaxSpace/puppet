class install_programs::install_devtools {
    $apt_packages = ['python', 'arduino','kicad','cmake','kdevelop','gitk','build-essential']

    package { $apt_packages: ensure => latest}
}
