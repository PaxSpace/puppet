class base_computer::member_user {
    user {'member':
        ensure => 'present',
        home => '/home/member',
        password => 'member',
        groups => ['dialout', 'cdrom', 'floppy', 'audio', 'dip', 'video', 'plugdev', 'netdev', 'lpadmin', 'scanner', 'bluetooth']
    }

    tidy {'empty_downloads':
        path => '/home/member/Downloads',
        age => '3days',
        recurse => 'true',
        rmdirs => 'true'
    }
}
