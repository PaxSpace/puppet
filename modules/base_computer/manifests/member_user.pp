class base_computer::member_user {
    
    $groups = ['dialout', 'cdrom', 'floppy', 'audio', 'dip', 'video', 'plugdev', 'netdev', 'lpadmin', 'scanner', 'bluetooth']
    group {'addingGroups' : name => $groups, ensure => present}
    
    user {'member':
        ensure => 'present',
        home => '/home/member',
        password => 'member',
        groups => $groups,
        require => group['addingGroups']
    }

    tidy {'empty_downloads':
        path => '/home/member/Downloads',
        age => '3days',
        recurse => 'true',
        rmdirs => 'true'
    }
}
