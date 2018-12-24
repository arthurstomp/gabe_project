class Product
  # NOTE: Keep it until file storage
  @@products = []

  attr_accessor :name

  def self.products
    @@products
  end

  def initialize(name, preco)
    @name = name
    @preco = preco 
    @@products.push(self)
  end
end
