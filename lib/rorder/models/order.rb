require 'concurrent'

module Rorder
  module Models
    class Order
      include Mongoid::Document

      field :amount, type: Float
      field :status, type: String

      def self.create_async order
        Concurrent::Promise.new { self.create order }
      end
    end
  end
end
