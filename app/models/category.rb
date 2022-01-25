class Category < ApplicationRecord
  has_many :category_products

  def products
    category_products = CategoryProduct.where(:category_id => id)
    products = []
    category_products.each do |item|
      product = Product.find_by(:id => item.product_id)
      products << product
    end
    return products
  end
end
