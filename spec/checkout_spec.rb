# frozen_string_literal: true

require 'rspec'
require_relative '../lib/checkout'

RSpec.describe Checkout do
  it 'can be instantiated with a variable' do
    checkout = Checkout.new('test')
    expect(checkout).to be_a(Checkout)
  end
end
