class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :tax, :total, :description, :primary_image
  belongs_to :supplier
  has_many :images
  has_many :categories
end
