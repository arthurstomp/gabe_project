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

  private

  class NotAProductError < StandardError; end

  def set_product(product)
    raise NotAProductError unless product.is_a? Product
    @product = product
  end
end
