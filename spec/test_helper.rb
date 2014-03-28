ENV['RACK_ENV'] = 'test'
require_relative '../fresh_popcorn_app.rb'

require 'minitest/autorun'
require 'rack/test'
