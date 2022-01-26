class OrderSerializer < ActiveModel::Serializer
  attributes :id, :tax, :subtotal, :total, :carted_products, :products
end
