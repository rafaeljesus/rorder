require 'rorder/models/order'
require 'rorder/util/trace'

module Rorder
  module Routes
    class Order < Base
      create = -> do
        composite = Concurrent::Promise.zip(
          Rorder::Util::Trace.ok(@payload),
          Rorder::Models::Order.create_async(@payload)
        ).execute.value!

        order = composite[1]
        json order
      end

      post '/orders', &create
    end
  end
end
