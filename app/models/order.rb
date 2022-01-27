class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def perform_calculations
    calc_subtotal = 0
    calc_tax = 0
    carted_products.each do |item|
      calc_subtotal += item.product.price * item.quantity
      calc_tax += item.product.tax * item.quantity
    end
    self.subtotal = calc_subtotal
    self.tax = calc_tax
    self.total = calc_subtotal + calc_tax
    self.save
  end
end
