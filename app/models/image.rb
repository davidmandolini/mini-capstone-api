class Image < ApplicationRecord
  # validates :url, :presence => true
  validates :product_id, :presence => true, :numericality => { :only_integer => true }

  belongs_to :product
end
