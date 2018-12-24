require "json"
class Transaction
  FilePath = "./transactions.json"
  attr_reader :product, :amount, :price
  @@transactions = []

  def initialize(product, amount, price)
    set_product(product)
    @amount = amount
    @price = price
    # @@transactions.push(self)
  end

  def add(t)
    @@transactions.push(t)
  end

  def self._prepare_transactions
    JSON.parse(File.read(FilePath)).map do |t|
      h = parse(t)
      new t["product"], t["amount"], t["price"]
    end
  end

  @@transactions = _prepare_transactions

  def self.transactions
    @@transactions
  end

  def self.save
    hashed_transactions = @@transactions.map do |t|
      JSON.generate(p.hashed_attrs)
    end
    File.open(FilePath, 'w') do |f|
      f.write hashed_transactions
    end
  end

  def hashed_attrs
    {
      product: @product,
      amount: @amount,
      price: @price
    }
  end

  def self.stock(prod_name)
    stock = 0
    Product.products.each do |p|
      Transaction.transactions.each do |t|
        if p.name == prod_name
          stock += t.amount
        end
      end
    end
    return stock
  end

  private

  class NotAProductError < StandardError; end

  def set_product(product)
    raise NotAProductError unless product.is_a? Product
    @product = product
  end

end
