# frozen_string_literal: true 

Product = Struct.new(:code, :name, :price) do
  def to_s
    "#{code} - #{name} - £#{format('%.2f', price)}"
  end
end
