require 'bunny'
require 'json'

module Rorder
  module Util
    class Rabbitmq
      class << self
        def start
          connection ||= Bunny.new
          connection.start
          channel = connection.create_channel
          @queue = channel.queue 'events', durable: true
        end

        def publish payload
          @queue.publish payload.to_json
        end
      end
    end
  end
end
