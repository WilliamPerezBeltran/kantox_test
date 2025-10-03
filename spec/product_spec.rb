# frozen_string_literal: true

require 'rspec'
require '../lib/product'

Rspec.describe Product do
  let(:product) { Product.new('PR1', 'product1', 5.89) }

  describe '' do
    it 'formatting the product as a string' do
      expect(product.to_s).to ep('PR1 - product1 - £5.89')
    end
  end
end
