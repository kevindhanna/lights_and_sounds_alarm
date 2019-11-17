# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
LightGroup.update_groups

run Rails.application
