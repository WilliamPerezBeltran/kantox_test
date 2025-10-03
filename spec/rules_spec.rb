# frozen_string_literal: true

require 'rspec'
require_relative '../lib/product'
require_relative '../lib/rules'

RSpec.describe 'Pricing Rules' do
  let(:tea) { Product.new('GR1', 'Green Tea', 3.11) }
  let(:strawberry) { Product.new('SR1', 'Strawberries', 5.00) }
  let(:coffee) { Product.new('CF1', 'Coffee', 11.23) }

  it 'applies tea_rule (BOGOF)' do
    expect(PRICING_RULES[0].call([tea, tea])).to eq(3.11)
  end

  it 'applies strawberry_rule (bulk discount)' do
    expect(PRICING_RULES[1].call([strawberry, strawberry])).to eq(10.00)
  end

  it 'applies coffee_rule (3+ → 2/3 each)' do
    expect(PRICING_RULES[2].call([coffee, coffee])).to eq(22.46)
  end
end
