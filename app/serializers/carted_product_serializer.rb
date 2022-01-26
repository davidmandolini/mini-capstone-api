class CartedProductSerializer < ActiveModel::Serializer
  attributes :id, :product, :user, :status, :quantity
end
