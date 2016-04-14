require 'net/http'
require 'json'

class CongressV3::Request
  BASE_URI = 'https://congress.api.sunlightfoundation.com'
  attr_accessor :route, :params

  def initialize(route, params)
    if !CongressV3::Config.api_key || CongressV3::Config.api_key.empty?
      raise Exception.new("API Key MUST be set!")
    end

    defaults = { page: 1, apikey: CongressV3::Config.api_key }
    @route = route
    @params = defaults.merge(params)
  end

  def self.legislators(params={})
    new("/legislators", params).request['results'].map do |legislator|
      CongressV3::Legislator.new(legislator)
    end
  end

  def request
    uri = URI(BASE_URI + route)
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
