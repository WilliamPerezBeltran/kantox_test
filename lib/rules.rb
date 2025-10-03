# frozen_string_literal: true 

require_relative 'price_policy'

tea_rule = PricePolicy.new('GR1') do |items|
  (items.size / 2.0).ceil * items.first.price
end

strawberry_rule = PricePolicy.new('SR1') do |items|
  items.size >= 3 ? items.size * 4.50 : items.sum(&:price)
end

coffee_rule = PricePolicy.new('CF1') do |items|
  items.size >= 3 ? (items.size * (items.first.price * 2.0 / 3.0)).round(2) : items.sum(&:price).round(2)
end

PRICING_RULES = [tea_rule, strawberry_rule, coffee_rule].freeze
