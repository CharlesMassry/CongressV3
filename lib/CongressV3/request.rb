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
    response = new("/legislators", params).request

    response.results.map! do |legislator|
      CongressV3::Legislator.new(legislator)
    end

    response
  end

  def request
    uri = URI(BASE_URI + route)
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get(uri)
    CongressV3::Response.new(JSON.parse(response))
  end
end
