class base_computer::update_modules {
    vcsrepo { '/opt/puppet':
        ensure => latest,
        provider => git,
        source => 'https://github.com/PaxSpace/puppet.git',
        revision => 'master'
    }

    cron { 'runPuppetUpdates' :
        ensure => present,
        command => "cd /opt/puppet/ && /bin/bash /opt/puppet/runAgent.sh",
        minute => ['0','30']
    }
}
