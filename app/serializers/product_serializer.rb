class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :tax, :total, :is_discounted?, :description, :img_url, :supplier_id, :supplier
end
