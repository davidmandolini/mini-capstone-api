class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def perform_calculations
    subtotal = 0
    tax = 0
    self.carted_products.each do |item|
      subtotal += item.product.price * item.quantity
      tax += item.product.tax * item.quantity
    end
    self.subtotal = subtotal
    self.tax = tax
    self.total = self.subtotal + self.tax
    self.save
  end
end
