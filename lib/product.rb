# frozen_string_literal: true 

Product = Struct.new(:code, :name, :price) do
  def initialize(code, name, price)
    raise TypeError, 'code must be a string' unless code.is_a?(String)
    raise TypeError, 'name must be a string' unless name.is_a?(String)
    raise TypeError, 'price must be a float' unless price.is_a?(Float)

    super
  end

  def to_s
    "#{code} - #{name} - £#{format('%.2f', price)}"
  end
end
