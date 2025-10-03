# frozen_string_literal: true 

# pricing policies
class PricePolicy
  attr_reader :code, :calculate_rule

  def initialize(code, &block)
    @code = code
    @calculate_rule = block
  end

  def assigned_to?(product_code)
    product_code.eql?(code)
  end

  def call(items)
    calculate_rule.call(items)
  end
end
