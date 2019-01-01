class Transaction
  attr_reader :product, :amount, :price
  @@transactions = []

# CONFIRMS THAT PARAMETER product IS OF TYPE Product Class
    def set_product(product)
      raise NotAProductError unless product.is_a? Product
      @product = product
    end

  def initialize(product, amount, price)
    set_product(product)
    @amount = amount
    @price = price
    @@transactions.push(self)
  end

  def self.transactions
    @@transactions
  end

# UPDATES STOCK AND RETURNS IF FOR DOUBLE VERIFICATION
def self.update_stock(prod_name)
  Product.products.each do |p|
    Transaction.transactions.each do |t|
      if prod_name == p.name
        p.stock += t.amount
        return p.stock
      end
    end
  end
end

def self.view_stock(prod_name)
  x = nil
  Product.products.each do |p|
    if p.name == prod_name
      x = p
    end
  end
  return x.stock
end

  private

  class NotAProductError < StandardError; end

end
