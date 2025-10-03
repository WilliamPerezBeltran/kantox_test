# frozen_string_literal: true

require 'rspec'
require_relative '../lib/product'

RSpec.describe Product do
  let(:product) { Product.new('PR1', 'product1', 5.89) }

  context 'type validations' do
    it 'raises error if code is not a string' do
      expect { Product.new(23, 'product1', 5.89) }.to raise_error(TypeError)
    end

    it 'raises error if name is not a string' do
      expect { Product.new('PR1', 234, 5.89) }.to raise_error(TypeError)
    end

    it 'raises error if price is not a float' do
      expect { Product.new('PR1', 'product1', 5) }.to raise_error(TypeError)
    end
  end

  context 'attributes' do
    it 'has the correct code' do
      expect(product.code).to eq('PR1')
    end

    it 'has the correct name' do
      expect(product.name).to eq('product1')
    end

    it 'has the correct price' do
      expect(product.price).to eq(5.89)
    end
  end

  describe '#to_s' do
    it 'formats the product as a string' do
      expect(product.to_s).to eq('PR1 - product1 - £5.89')
    end
  end
end
