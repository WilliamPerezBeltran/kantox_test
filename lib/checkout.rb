# frozen_string_literal: true

# class checkout empty
class Checkout
  attr_reader :rules, :elements
  
  def initialize(rules = [])
    @rules = rules 
    @elements = []
  end

  def scan(product)
    @elements << product
  end

  def total
    return 0.0 if @elements.empty?

    @elements.reduce(0) { |aco, elem| aco + elem.price }.round(2)
  end
end
