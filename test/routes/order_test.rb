require 'json'
require 'rack/test'
require 'test_helper'
require 'rorder'

describe 'Rorder::Routes::Order' do
  include Rack::Test::Methods

  def app
    Rorder::App
  end

  describe '.post' do
    it 'should create order' do
      data = {'amount' => '69.9', 'status' => 'pending'}.to_json
      post '/orders', data, provides: 'json'
      body = JSON.parse last_response.body
      refute_nil body['_id']
    end
  end
end
