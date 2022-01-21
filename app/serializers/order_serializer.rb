class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :tax, :subtotal, :total, :product
end
