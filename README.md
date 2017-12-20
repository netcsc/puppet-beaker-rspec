## Run test
If you want to install Puppet 3.x, that’s easy: set $PUPPET_INSTALL_VERSION to the version you want, and ensure that $PUPPET_INSTALL_TYPE is unset. In other words:
```
$ export PUPPET_INSTALL_VERSION=3.3.2
$ bundle exec rake beaker
```

If you want to install Puppet 4.x, however, the $PUPPET_INSTALL_TYPE must be set to agent, and then $PUPPET_INSTALL_VERSION takes on a new meaning, as the version of the Puppet Agent. Thankfully there’s a matrix converting Puppet versions and Puppet Agent versions here. So if I want Puppet version 4.4.2, then I need Agent version 1.4.2. 
So here goes:
```
$ export PUPPET_INSTALL_TYPE=agent
$ export PUPPET_INSTALL_VERSION=1.4.2  # Now denotes Puppet Agent version!!
$ bundle exec rake beaker
```

## Specifying the node set
Specifying the node set is much easier. Just set the variable $BEAKER_set to the node set:
```
$ export BEAKER_set=centos-72-x64
$ bundle exec rake beaker
```

If left unset, it will default to default (i.e. it will use whatever is specified in spec/acceptance/nodesets/default.yml.

## Other important environment variables
Another important environment variable is $BEAKER_destroy. If you set this to no, the VM will not be destroyed after the test/s.
This is really useful for debugging, and perhaps the best part, your acceptance tests double as a convenient way of quickly spinning up a VM that is ready-configured by Puppet. So if I ever want a Spacewalk server to play with, I just run my spec test, and voila!

## Understanding the output
To begin, Rspec is called, and it is quite common to call the rspec command directly:
```
$ bundle exec rspec spec/acceptance/init_spec.rb
```    