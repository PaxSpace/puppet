class base_computer {
    exec {"apt-get update" :
        command => "/usr/bin/apt-get update"
    }
    
    package {"cron" : ensure => "latest"}
    package {"vim" : ensure => "latest"}
    package {"git" : ensure => "latest"}
    package {"sudo" : ensure => "latest"}
}
