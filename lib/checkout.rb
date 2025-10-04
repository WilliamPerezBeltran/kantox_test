# frozen_string_literal: true

# class checkout 
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
    @elements
      .group_by(&:code)
      .sum { |code, products| apply_to(code)&.call(products) || products.sum(&:price) }
      .round(2)
  end

  private

  def apply_to(code)
    @rules.detect { |rule| rule.assigned_to?(code) }
  end
end
