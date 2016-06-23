require 'bunny'
require 'json'

module Rorder
  module Util
    class Rabbitmq
      class << self
        attr_reader :channel

        def start
          connection ||= Bunny.new
          connection.start
          @channel = connection.create_channel
        end
      end
    end
  end
end
