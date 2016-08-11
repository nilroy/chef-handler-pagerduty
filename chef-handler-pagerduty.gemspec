lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'chef/handler/pagerduty/version'

Gem::Specification.new do |s|
  s.name = 'chef-handler-pagerduty'
  s.version = PagerdutyHandler::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = "Chef report handler that uses pagerduty API to raise an alert"
  s.description = s.summary
  s.author = "Nilanjan Roy"
  s.email = "nilanjan1.roy@gmail.com"
  s.homepage = "https://github.com/nilroy/chef-handler-pagerduty"
  s.require_path = 'lib'
  s.files = %w(LICENSE README.md) + Dir.glob("lib/**/*")
  s.add_runtime_dependency "pagerduty"
end
