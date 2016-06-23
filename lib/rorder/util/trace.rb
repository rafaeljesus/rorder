require 'concurrent'
require 'rorder/util/rabbitmq'

module Rorder
  module Util
    class Trace
      class << self
        def ok payload
          Concurrent::Promise.new do
            Rorder::Util::Rabbitmq.publish payload
          end
        end
      end
    end
  end
end
