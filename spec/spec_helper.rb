require 'puppetlabs_spec_helper/module_spec_helper'
require 'hiera'

RSpec.configure do |c|
    c.color  = true
    c.format = :documentation
    #c.default_facts = {
    #  :osfamily => 'RedHat',
    #  :operatingsystemmajrelease => '7',
    #}
  end