require 'active_record'
require 'date'
require 'hue'
require 'sinatra/base'
require 'sinatra/activerecord'
require_relative '../app/models/init'
require_relative '../app/helpers/init'

# puts "Environment #{ENV['RACK_ENV']}"
# case ENV['RACK_ENV']
# when 'development'
#   p "Connecting to dev database..."
#   ActiveRecord::Base.establish_connection(
#     YAML.safe_load(
#       File.open(
#         File.expand_path('./config/database.yml')
#       )
#     )['development']
#   )
#   p "Connected to #{ActiveRecord::Base.connection_config[:database]}"
# when 'test'
#   p "Connecting to test database..."
#   ActiveRecord::Base.establish_connection(
#     YAML.safe_load(
#       File.open(
#         File.expand_path('./config/database.yml')
#       )
#     )['test']
#   )
#   p "Connected to #{ActiveRecord::Base.connection_config[:database]}"
# end