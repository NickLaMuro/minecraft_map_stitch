# -*- encoding: utf-8 -*-
require File.expand_path('../lib/map_stitcher/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'map_stitcher'
  s.version     = MinecraftMapStitch::VERSION
  s.date        = '2012-07-09'
  s.summary     = "Stitch together Minecraft maps"
  s.description = "This gem takes in the directory of your Minecraft map_*.dat files and combines them all into a single image."
  s.authors     = ["Mike Weber"]
  s.email       = 'mike@weberapps.com'
  s.require_paths = ["lib"]
  s.files       = [
    "lib/map_stitcher.rb", 
    "lib/map_stitcher/minecraft_map.rb",
    "lib/map_stitcher/map_collector.rb",
    "lib/map_stitcher/colors.txt"
  ]

  s.add_runtime_dependency "nbtfile", "0.2.0"
  s.add_runtime_dependency "chunky_png", "1.2.5"

  s.add_development_dependency "rspec", "2.11.0"
  s.add_development_dependency "mocha", "0.12.0"
end
