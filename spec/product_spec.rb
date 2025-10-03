# frozen_string_literal: true

require 'rspec'
require_relative '../lib/product'

RSpec.describe Product do
  let(:product) { Product.new('PR1', 'product1', 5.89) }

  describe 'to_s' do
    it 'formats the product as a string' do
      expect(product.to_s).to eq('PR1 - product1 - £5.89')
    end
  end
end
