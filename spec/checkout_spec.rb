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

  it 'basket: GR1, SR1, GR1, GR1, CF1 = £22.45' do
    scan_products([gr1, sr1, gr1, gr1, cf1])
    expect(co.total).to eq(22.45)
  end

  it 'basket: GR1, GR1 = £3.11' do
    scan_products([gr1, gr1])
    expect(co.total).to eq(3.11)
  end

  it 'basket: SR1, SR1, GR1, SR1 = £16.61' do
    scan_products([sr1, sr1, gr1, sr1])
    expect(co.total).to eq(16.61)
  end

  it 'basket: GR1, CF1, SR1, CF1, CF1 = £30.57' do
    scan_products([gr1, cf1, sr1, cf1, cf1])
    expect(co.total).to eq(30.57)
  end
end
