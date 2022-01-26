class OrderSerializer < ActiveModel::Serializer
  attributes :id, :tax, :subtotal, :total
  has_many :carted_products
  has_many :products, through: :carted_products
end
