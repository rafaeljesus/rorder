require 'json'
require 'rack/test'
require 'test_helper'
require 'rorder'

describe 'Rorder::Routes::HealthCheck' do
  include Rack::Test::Methods

  def app
    Rorder::App
  end

  describe '.get' do
    it 'should respond with json' do
      get '/health_check'
      body = JSON.parse last_response.body
      assert_equal body['message'], 'API running!'
    end
  end
end
