class base_computer::update_modules {
    vcsrepo { '/opt/puppet':
        ensure => latest,
        provider => git,
        source => 'https://github.com/PaxSpace/puppet.git',
        revision => 'dev'
    }

    file { "/var/log/puppet_agent" :
        ensure => directory,
        require => Cron['runPuppetUpdates']
    }

    service {"cron":
        enable => true,
        ensure => 'running',
        before => Cron['runPuppetUpdates']
    }

    cron { 'runPuppetUpdates' :
        ensure => present,
        command => 'cd /opt/puppet/ && /bin/bash /opt/puppet/runAgent.sh > /var/log/puppet_agent/`date +\%Y\%m\%d-\%H\%M`.log 2>&1',
        minute => '*',
        hour => '11'
    }

    tidy {'clear_agent_logs':
        path => '/var/log/puppet_agent',
        age => '5days',
        recurse => 'true',
        rmdirs => 'true',
        require => File['/var/log/puppet_agent']
    }
}
