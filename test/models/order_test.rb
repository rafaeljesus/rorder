require 'test_helper'
require 'rorder'

describe 'Rorder::Models::Order' do
  after { Rorder::Models::Order.delete_all }

  describe '.create_async' do
    it 'should create order async' do
      order = { amount: 9.99, status: 'pending' }
      promise = Rorder::Models::Order.create_async(order).execute
      refute_nil promise.value._id
    end
  end
end
