class Transaction
  attr_reader :product, :amount, :price
  @@transactions = []

  def self.transactions
    @@transactions
  end

  def initialize(product, amount, price)
    set_product(product)
    @amount = amount
    @price = price
    @@transactions.push(self)
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
