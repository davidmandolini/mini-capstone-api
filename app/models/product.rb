class Product < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true, :numericality => { :greater_than => 0 }
  validates :description, :length => { :minimum => 10, :maximum => 500 }
  validates :supplier_id, :presence => true, :numericality => { :only_integer => true }
  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products

  def is_discounted?
    price > 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def primary_image
    if images.length > 0
      return images[0].url
    else
      return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpfTuch8F_PkEaqS6nATu1Bwm6ppJrPcghMg&usqp=CAU"
    end
  end
end
