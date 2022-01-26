class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :tax, :total, :is_discounted?, :description, :supplier_id
  belongs_to :supplier
  has_many :images
  has_many :categories
end
