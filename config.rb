require_relative "product"
require_relative "transaction"

# Operations on the project
# Add product type;
# Buy more of the product;
# Sell the product;

class Project

  def self.stock(prod_name)
    Transaction.stock(prod_name)
  end

  def self.new_product(name, price)
    Product.new(name, price)
  end

  def self.buy_product(prod_name, amount, total_paid)
    Transaction.new(search_product_by_name(prod_name), amount, total_paid)
  end

  def self.sell_product(prod_name, amount, total_price)
    # TODO
    Transaction.new(search_product_by_name(prod_name), amount, total_price)
  end

  def self.list_transactions
    Transaction.transactions.each do |t|
      puts t
    end
  end

  private

  def self.search_product_by_name(name)
    x = nil
    Product.products.each do |p|
      if p.name == name
        x = p
      end
    end
    return x
  end
end
