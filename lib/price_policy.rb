# frozen_string_literal: true 

# pricing policies
class PricePolicy
  def initialize(code, calculate_rule)
    @code = code
    @calculate_rule = calculate_rule
  end
end
