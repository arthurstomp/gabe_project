class Product
  # NOTE: Keep it until file storage
  @@products = []

  attr_accessor :name

  def initialize(name, price)
    @name = name
    @price = price
    @@products.push(self)
  end

  def self.products
    @@products
  end

end
