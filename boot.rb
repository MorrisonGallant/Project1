require 'rubygems'
require 'bundler'
require 'yaml'

Bundler.require(:default)

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

require_rel 'models/*'