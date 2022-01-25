class Category < ApplicationRecord
  has_many :category_products

  def products
    CategoryProduct.where(:category_id => id)
  end
end
