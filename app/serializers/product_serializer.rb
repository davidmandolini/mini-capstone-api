class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :tax, :total, :is_discounted?, :description, :images, :supplier_id, :supplier, :images
end
