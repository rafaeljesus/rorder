require 'bundler/setup'
require 'yaml'
require 'mongoid'

$LOAD_PATH.unshift File.expand_path '../../lib', __FILE__
settings_file = File.expand_path '../settings.yml', __FILE__
mongo_file = File.expand_path '../mongoid.yml', __FILE__

ENVIRONMENT = ENV['ENVIRONMENT'] || 'development'
SETTINGS = YAML.load_file(settings_file)[ENVIRONMENT]
Mongoid.load!(mongo_file, ENVIRONMENT)
