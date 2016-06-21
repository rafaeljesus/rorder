module Rorder
  module Routes
    class HealthCheck < Base
      index = -> { json message: 'API running!' }
      get '/health_check', &index
    end
  end
end
