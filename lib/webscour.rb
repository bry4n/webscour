require 'rubygems'
require 'nibbler'
require 'nokogiri'
require 'faraday'

class WebScour
  attr_accessor :uri, :document, :klass
  def self.parse(uri, &block)
    new(uri, &block)
  end

  def initialize(uri, &block)
    @document, @uri = fetch uri
    @klass = Class.new(Nibbler) { instance_eval(&block) }.parse(@document.body)
  end

  def method_missing(m)
    @klass.send(:"#{m}")
  end

  private
  def fetch(uri)
    response = Faraday.get uri
    if [301,302].include?(response.status)
      uri = response.headers['location']
      response = fetch(uri).first
    end
    [response, uri]
  end
end
