require 'concurrent'
require 'rorder/util/rabbitmq'

module Rorder
  module Producer
    class Trace
      class << self
        def create_queue
          channel = Util::Rabbitmq.channel
          @queue = channel.queue 'events', durable: true
        end

        def ok payload
          data = {name: 'order_created', status: 'ok', payload: payload}
          publish data
        end

        def fail payload, error
          data = {name: 'order_created', status: 'fail', payload: payload, error: error}
          publish data
        end

        private
        def publish payload
          Concurrent::Promise.new { @queue.publish payload.to_json }
        end
      end
    end
  end
end
