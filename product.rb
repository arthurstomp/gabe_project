class Product
  # NOTE: Keep it until file storage
  @@products = []

  attr_accessor :name

  def self.products
    @@products
  end

  def initialize(name, price)
    @name = name
    @preco = price
    @@products.push(self)
  end
end
