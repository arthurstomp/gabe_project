require 'json'
class Product
  # NOTE: Keep it until file storage
  FilePath = "./products.json"

  attr_accessor :name

  def initialize(name, price)
    @name = name
    @price = price
    #@@products.push(self)
  end

  def self.add(p)
    @@products.push p
  end

  def self._prepare_products
    JSON.parse(File.read(FilePath)).map do |p|
      h = JSON.parse(p)
      new h["name"], h["price"]
    end
  end

  @@products = _prepare_products

  def self.products
    @@products
  end

  def self.save
    hashed_products = @@products.map do |p|
      JSON.generate(p.hashed_attrs)
    end
    File.open(FilePath, 'w') do |f|
      f.write hashed_products
    end
  end


  def hashed_attrs
    {
      name: @name,
      price: @price
    }
  end
end
