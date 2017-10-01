class install_programs::remove_browsers {
    package { 'google-chrome': ensure => absent }
}
