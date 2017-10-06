class base_computer {
    schedule { "dailyAt11" :
        period => daily,
        range => '23:00-00:00'
    }

    exec {"apt-get update" :
        command => "/usr/bin/apt-get update",
        schedule => "dailyAt11"
    }
    
    $packages = [ 'rsyslog', 'cron', 'vim', 'git', 'sudo']
    package {$packages : ensure => "latest", require => Exec['apt-get upgrade']}
    
    exec { "apt-get upgrade" : 
        command => "/usr/bin/apt-get upgrade -y",
        require => Exec['apt-get update'],
        schedule => "dailyAt11"
    }
}
