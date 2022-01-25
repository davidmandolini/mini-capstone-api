class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :tax, :total, :is_discounted?, :description, :supplier_id
  belongs_to :supplier, :images
  has_many :categories
end
