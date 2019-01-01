require_relative "product"
require_relative "transaction"

# Operations on the project
# Add product type;
# Buy more of the product;
# Sell the product;
# Get profit of all;
# Get profit by product;

class Project

  def self.view_stock(prod_name)
    Transaction.view_stock(prod_name)
  end

  def self.new_product(name, price)
    Product.new(name, price)
  end

  def self.buy_product(prod_name, quant, total_paid)
    Transaction.new(search_product_by_name(prod_name), quant, total_paid)
  end

  def self.sell_product(prod_name, quant, total_price)
    # TODO
    Transaction.new(search_product_by_name(prod_name), quant, total_price)
  end

  def self.list_transactions
    Transaction.transactions.each do |t|
      puts "product name: " + t.product.name
      puts "amount: " + t.amount.to_s
      puts "total price: " + t.price.to_s
    end
  end

def self.list_products
  Product.products.each do |p|
    puts "name: " + p.name
    puts "price: " + p.price.to_s
    puts "stock: " + p.stock.to_s
    puts "\n"
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
