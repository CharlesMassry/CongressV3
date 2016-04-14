$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'CongressV3'
require "webmock/rspec"
require "vcr"
require 'dotenv'
require 'coveralls'

Coveralls.wear!
Dotenv.load
CongressV3::Config.api_key = ENV["SUNLIGHT_API_KEY"]

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |c|
  c.cassette_library_dir = "vcr_cassettes"
  c.hook_into :webmock
end

