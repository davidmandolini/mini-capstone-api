class ProductSerializer < ActiveModel::Serializer
  belongs_to :supplier
  has_many :images
  has_many :categories
end
