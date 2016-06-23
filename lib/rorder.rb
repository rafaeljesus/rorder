require 'sinatra/base'
require 'sinatra/json'

require 'rorder/version'
require 'rorder/util/rabbitmq'
require 'rorder/producer/trace'
require 'rorder/producer/order'
require 'rorder/routes/index'

module Rorder
  class App < Sinatra::Application
    configure { set :server, :puma }
    configure do
      disable :method_override
      disable :static
      enable  :raise_errors
    end

    Util::Rabbitmq.start
    Producer::Trace.create_queue
    Producer::Order.create_queue

    use Routes::HealthCheck
    use Routes::Order
  end
end
