class base_computer::member_user {
    
    $groups = ['dialout', 'cdrom', 'floppy', 'audio', 'dip', 'video', 'plugdev', 'netdev', 'lpadmin', 'scanner', 'bluetooth']
    group {$groups : ensure => present}
    
    user {'member':
        allowdupe => false,
        ensure => 'present',
        home => '/home/member',
        password => '$6$3bzfMnIx$8Bq9u42Ti0zasUlIRxwIzN6FOwiovG1dVWyqifh1CYwNernLDzt.MhtgnLKZbADCWf8jHqlpGmKsddGa3EXmI1',
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
        rmdirs => 'true',
        require => File['/home/member/Downloads']
    }
}
