require "vcr"
require File.expand_path(File.dirname(__FILE__) + '/../lib/freegeoip')

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :faraday
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.mock_framework = :rspec
  config.expect_with(:rspec) { |c| c.syntax = :should }
end
