class Supplier < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true
  validates :phone_number, :length => { :minimum => 10, :maximum => 20 }

  def products
    Product.where(:supplier_id => id)
  end
end
