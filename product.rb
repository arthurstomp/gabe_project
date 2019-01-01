require_relative "transaction"
class Product
  # NOTE: Keep it until file storage
  @@products = []

  attr_accessor :name, :stock

  def initialize(name, price)
    @name = name
    @price = price
    @stock = 0
    @@products.push(self)
  end

  def self.products
    @@products
  end

end
