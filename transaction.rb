class Transaction
  attr_reader :product, :amount, :price
  @@transactions = []

  def self.transactions
    @@transactions
  end

  def initialize(product, amount, price)
    @product = product
    @amount = amount
    @price = price
    @@transactions.push(self)
  end
end
