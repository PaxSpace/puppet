class base_computer::member_user {
    
    $groups = ['dialout', 'cdrom', 'floppy', 'audio', 'dip', 'video', 'plugdev', 'netdev', 'lpadmin', 'scanner', 'bluetooth']
    group {$groups : ensure => present}
    
    user {'member':
        allowdupe => false,
        ensure => 'present',
        home => '/home/member',
        password => 'member',
        groups => $groups,
        managehome => 'true',
        comment => "member User",
        shell => "/bin/bash",
        require => Group['bluetooth']
    }
    
    file { "/home/member" :
        ensure => directory,
        owner => 'member',
        group => 'member',
        mode => '0644',
        require => User['member']
    }

    file { "/home/member/Downloads" :
        ensure => directory,
        owner => 'member',
        group => 'member',
        mode => '0644',
        require => File['/home/member'],
        before => Tidy['empty_downloads']
    }

    tidy {'empty_downloads':
        path => '/home/member/Downloads',
        age => '3days',
        recurse => 'true',
        rmdirs => 'true' 
    }
}
