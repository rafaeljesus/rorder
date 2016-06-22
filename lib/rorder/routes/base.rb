require 'json'

module Rorder
  module Routes
    class Base < Sinatra::Application
      before do
        next unless request.post?
        request.body.rewind
        @payload = JSON.parse request.body.read
      end

      configure do
        set :root, File.expand_path('../../../', __FILE__)

        disable :method_override
        disable :protection
        disable :static

        enable :use_code
        set :show_exceptions, :after_handler
      end
    end
  end
end
