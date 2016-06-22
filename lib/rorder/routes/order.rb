require 'rorder/models/order'

module Rorder
  module Routes
    class Order < Base
      create = -> do
        promise = Rorder::Models::Order.create_async(@payload).execute
        json promise.value
      end

      post '/orders', &create
    end
  end
end
