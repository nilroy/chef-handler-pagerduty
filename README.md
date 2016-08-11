# DESCRIPTION:

A simple chef report handler that uses the pagerduty gem to send pagerduty alerts for failed chef run.

# USAGE:

Using /etc/chef/config.rb

    require 'rubygems'
    require 'chef/handler/pagerduty'

    pagerduty_handler = PagerdutyHandler.new
    exception_handlers << pagerduty_handler


Using chef_handler LWRP

    chef_gem 'chef-handler-pagerduty'
    require 'chef/handler/pagerduty'

    chef_handler 'PagerdutyHandler' do
       source 'chef/handler/pagerduty'
       arguments [
         :api_key => <pagerduty API Key>,
         :fqdn    => <FQDN of the node>
       ]
       action :nothing
    end.run_action(:enable)

# LICENSE AND AUTHOR:

Author:: Nilanjan Roy (<nilanjan1.roy@gmail.com>)

Copyright:: 2016, Nilanjan Roy

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
