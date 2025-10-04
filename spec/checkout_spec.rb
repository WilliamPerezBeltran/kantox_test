# frozen_string_literal: true

require_relative '../lib/checkout'
require_relative '../lib/rules'

RSpec.describe Checkout do
  let(:gr1) { Product.new('GR1', 'Green tea', 3.11) }
  let(:sr1) { Product.new('SR1', 'Strawberries', 5.00) }
  let(:cf1) { Product.new('CF1', 'Coffee', 11.23) }
  let(:co)  { Checkout.new(PRICING_RULES) }

  def scan_products(products)
    products.each { |product| co.scan(product) }
  end

  it 'shopping cart: GR1, SR1, GR1, GR1, CF1 = £22.45' do
    scan_products([gr1, sr1, gr1, gr1, cf1])
    expect(co.total).to eq(22.45)
  end

  it 'shopping cart: GR1, GR1 = £3.11' do
    scan_products([gr1, gr1])
    expect(co.total).to eq(3.11)
  end

  it 'shopping cart: SR1, SR1, GR1, SR1 = £16.61' do
    scan_products([sr1, sr1, gr1, sr1])
    expect(co.total).to eq(16.61)
  end

  it 'shopping cart: GR1, CF1, SR1, CF1, CF1 = £30.57' do
    scan_products([gr1, cf1, sr1, cf1, cf1])
    expect(co.total).to eq(30.57)
  end

  it 'returns 0.0 for an empty shopping cart' do
    expect(co.total).to eq(0.0)
  end

  it 'returns the price of a single product' do
    scan_products([cf1])
    expect(co.total).to eq(11.23)
  end

  it 'applies Buy One, Get One rule correctly to Green tea' do
    scan_products([gr1, gr1, gr1, gr1])
    expect(co.total).to eq(6.22)
  end

  it 'applies rule of Strawberries when 3 or more' do
    scan_products([sr1, sr1, sr1])
    expect(co.total).to eq(13.50)
  end

  it 'applies rule of discount for Coffee when 3 or more' do
    scan_products([cf1, cf1, cf1])
    expect(co.total).to eq(((11.23 * 2 / 3.0) * 3).round(2))
  end
end
