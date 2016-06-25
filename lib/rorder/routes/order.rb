require 'rorder/models/order'
require 'rorder/producer/trace'
require 'rorder/producer/order'

module Rorder
  module Routes
    class Order < Base
      create = -> do
        begin
          composite = Concurrent::Promise.zip(
            Producer::Trace.ok(@payload),
            Models::Order.create_async(@payload)
          ).execute.value!

          order = composite[1]
          Producer::Order.created(order).execute
          json order
        rescue => e
          Producer::Trace.fail(@payload, e)
        end
      end

      post '/orders', &create
    end
  end
end
