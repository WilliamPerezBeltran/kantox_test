# frozen_string_literal: true

require 'rspec'
require_relative '../lib/checkout'
require_relative '../lib/product'

RSpec.describe Checkout do
  let(:checkout) { Checkout.new }
  let(:product1) { Product.new('PR1', 'product1', 1.24) }
  let(:product2) { Product.new('PR2', 'product2', 0.62) }

  describe '#scan' do
    it 'adds products to elements list' do
      checkout.scan(product1)
      expect(checkout.elements).to include(product1)
    end
  end

  describe '#total' do
    it 'There are no elements as a consecuense return 0.0' do
      expect(checkout.total).to eq(0.0)
    end

    it 'sums the prices of elements' do
      checkout.scan(product1)
      checkout.scan(product2)
      expect(checkout.total).to eq(1.86)
    end
  end
end
