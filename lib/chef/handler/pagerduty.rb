# Copyright:: 2017, Nilanjan Roy <nilanjan1.roy@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'rubygems'
require 'chef'
require 'chef/handler'
require 'pagerduty'

class PagerdutyHandler < Chef::Handler
  attr_reader :options
  def initialize(opts = {})
    @options = opts
  end

  def report
    if options[:api_key].nil?
      Chef::Log.error("Pagerduty API key not provided")
      raise Errno::ENOENT
    else
      pagerduty = Pagerduty.new(options[:api_key])
    end
    if ! success?
      description = "Chef run failed on node #{options[:fqdn]}"
      begin
        pagerduty.trigger(description)
      rescue Net::HTTPServerException => error
        Chef::Log.error("Could not raise pagerduty alert! Error - %s" - error.response.body)
      end
    end
  end
end
