source 'https://rubygems.org'

group :test do
    gem 'puppetlabs_spec_helper', '2.3.1', :require => false
end

group :system_tests do
  gem 'beaker',       :require => false
  gem 'beaker-rspec', :require => false
  gem 'beaker-puppet_install_helper', :require => false
end

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['~> 4.0']
gem 'puppet', puppetversion
gem 'facter', '>= 1.7.0'

gem 'puppet-lint-absolute_classname-check'
gem 'puppet-lint-leading_zero-check'
gem 'puppet-lint-trailing_comma-check'
gem 'puppet-lint-version_comparison-check'
gem 'puppet-lint-classes_and_types_beginning_with_digits-check'
gem 'puppet-lint-unquoted_string-check'
gem 'puppet-lint-variable_contains_upcase'
gem 'metadata-json-lint'
#gem 'rubocop'
gem 'pkg-config', '>= 1.1.7'
gem 'hiera-eyaml'
gem 'puppet-strings'
#gem 'puppet-blacksmith'
gem 'parallel_tests'
#gem 'winrm', '>= 2.2.3'
gem 'serverspec'