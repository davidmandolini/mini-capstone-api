class Product < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true, :numericality => { :greater_than => 0 }
  validates :description, :length => { :minimum => 10, :maximum => 500 }
  validates :supplier_id, :presence => true, :numericality => { :only_integer => true }

  def is_discounted?
    price > 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  # def supplier
  #   Supplier.find_by(:id => supplier_id)
  # end
  belongs_to :supplier
  has_many :images
end
