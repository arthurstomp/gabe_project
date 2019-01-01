class Transaction
  attr_reader :product, :amount, :price
  @@transactions = []

# CONFIRMS THAT PARAMETER product IS OF TYPE Product Class
    def set_product(product)
      raise NotAProductError unless product.is_a? Product
      @product = product
    end

    # UPDATES STOCK
    def update_stock
      x = Transaction.transactions.last
      Product.products.each do |p|
        if p == x.product
          p.stock += x.amount
        end
      end
    end

  def initialize(product, amount, price)
    set_product(product)
    @amount = amount
    @price = price
    @@transactions.push(self)
    update_stock
  end

  def self.transactions
    @@transactions
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
