# frozen_string_literal: true

require 'rspec'
require_relative '../lib/product'
require_relative '../lib/rules'

RSpec.describe 'Pricing Rules' do
  let(:tea) { Product.new('GR1', 'Green Tea', 3.11) }
  let(:strawberry) { Product.new('SR1', 'Strawberries', 5.00) }
  let(:coffee) { Product.new('CF1', 'Coffee', 11.23) }

  it 'applies tea_rule' do
    expect(PRICING_RULES[0].call([tea, tea])).to eq(3.11)
    expect(PRICING_RULES[0].call([tea, tea, tea])).to eq(6.22)
    expect(PRICING_RULES[0].call([tea, tea, tea, tea, tea])).to eq(9.33)
  end

  it 'applies strawberry_rule' do
    expect(PRICING_RULES[1].call([strawberry, strawberry])).to eq(10.00)
    expect(PRICING_RULES[1].call([strawberry, strawberry, strawberry])).to eq(13.50)
  end

  it 'applies coffee_rule' do
    expect(PRICING_RULES[2].call([coffee, coffee])).to eq(22.46)
    expect(PRICING_RULES[2].call([coffee, coffee, coffee])).to eq(22.46) 
    expect(PRICING_RULES[2].call([coffee, coffee, coffee, coffee])).to eq(29.95)
  end
end
