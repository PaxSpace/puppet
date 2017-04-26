class install_programs::remove_browsers {
    package { 'google-chrome': ensure => absent, require => Exec['apt-get update']}
}
