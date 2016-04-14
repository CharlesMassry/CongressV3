require 'httparty'

class CongressV3::Request
  include HTTParty
  base_uri 'https://congress.api.sunlightfoundation.com/'
  attr_accessor :route, :params

  def initialize(route, params)
    if !CongressV3::Config.api_key || CongressV3::Config.api_key.empty?
      raise Exception.new("API Key MUST be set!")
    end

    @route = route
    @params = { query: params }
    @params[:query][:apikey] = CongressV3::Config.api_key
  end

  def self.legislators(params={})
    params[:page] ||= 1
    new("/legislators", params).request['results'].map do |legislator|
      CongressV3::Legislator.new(legislator)
    end
  end

  def request
    self.class.get(route, params)
  end
end
