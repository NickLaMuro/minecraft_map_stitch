require 'rubygems'
require 'rspec'

$: << (File.dirname(__FILE__) + "/../lib")
require "map_stitcher"

RSpec.configure do |config|
  config.mock_framework = :mocha
end
