require 'sinatra/base'
require 'sinatra/json'

require 'rorder/version'
require 'rorder/routes/index'

module Rorder
  class App < Sinatra::Application
    configure { set :server, :puma }
    configure do
      disable :method_override
      disable :static
      enable  :raise_errors
    end

    use Routes::HealthCheck
    use Routes::Order
  end
end
