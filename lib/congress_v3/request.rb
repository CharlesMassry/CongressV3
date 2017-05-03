require 'net/http'
require 'json'
require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

class CongressV3::Request
  BASE_URI = 'https://congress.api.sunlightfoundation.com'
  attr_accessor :route, :params

  def initialize(route, params)
    if !CongressV3::Config.api_key || CongressV3::Config.api_key.empty?
      raise Exception.new("API Key MUST be set!")
    end

    defaults = { page: 1, apikey: CongressV3::Config.api_key, per_page: 50 }
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

  def self.bills(params)
    response = new("/bills", params).request

    response.results.map! do |bill|
      CongressV3::Bill.new(bill)
    end

    response
  end

  def self.bill_search(params)
    response = new("/bills/search", params).request

    response.results.map! do |bill|
      CongressV3::Bill.new(bill)
    end

    response
  end

  def self.votes(params)
    response = new('/votes', params).request

    response.results.map! do |vote|
      CongressV3::Vote.new(vote)
    end

    response
  end

  def self.bill_text(uri)
    html = Nokogiri::HTML(open(uri, allow_redirections: :all))
    html.css('body pre').text
  end

  def self.bill_votes(bill_id, params={})
    params[:bill_id] = bill_id
    params[:fields] = "voter_ids,chamber,vote_type,required,result,voted_at"
    response = new('/votes', params).request

    response
  end

  def self.legislator_votes(legislator_id, params={})
    request = new('/votes', params)
    uri = URI(BASE_URI + '/votes')
    uri.query = URI.encode_www_form(request.params) + '&voter_ids.' + legislator_id
    response = request.parse_response_body(uri)

    response.results.map! do |vote|
      CongressV3::Vote.new(vote)
    end

    response
  end

  def request
    uri = URI(BASE_URI + route)
    uri.query = URI.encode_www_form(params)
    parse_response_body(uri)
  end

  def parse_response_body(uri)
    response_body = Net::HTTP.get(uri)
    json_response = JSON.parse(response_body)
    CongressV3::Response.new(json_response)
  end
end
