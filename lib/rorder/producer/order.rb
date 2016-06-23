require 'concurrent'
require 'rorder/util/rabbitmq'

module Rorder
  module Producer
    class Order
      class << self
        def create_queue
          channel = Util::Rabbitmq.channel
          @queue = channel.queue 'order_created', durable: true
        end

        def created payload
          Concurrent::Promise.new do
            @queue.publish payload.to_json
          end
        end
      end
    end
  end
end
