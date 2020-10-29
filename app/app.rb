require 'sinatra/base'
require "sinatra/activerecord"

require_relative 'models/user'
require_relative 'models/space'
require_relative 'models/request'

require_relative 'controllers/app_controller'
require_relative 'controllers/home_controller'
require_relative 'controllers/registrations_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/spaces_controller'
require_relative 'controllers/requests_controller'
