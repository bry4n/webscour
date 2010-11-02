require 'rubygems'
require 'parka/specification'
require File.dirname(__FILE__) + '/lib/webscour/version'

Parka::Specification.new do |gem|
  gem.name      = "webscour"
  gem.version   = WebScour::VERSION
  gem.summary   = "Simple DSL Webpage Scraper using Nibbler + Nokogiri + Faraday (35 or less LOC)"
  gem.homepage  = "http://rubygems.org/gems/webscour"
  gem.email     = "bryann83@gmail.com"
  gem.author    = "Bryan Goines"
end

