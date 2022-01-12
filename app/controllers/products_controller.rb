class ProductsController < ApplicationController
  def all_products_method
    
    Product.all.each do |item|
    info = ""
    info += "Name: #{item.name}"
    info += "\n"
    info += "Price: $#{item.price}"
    info += "\n"
    info += "Description: #{item.description}"
    info += "\n\n\n"
    end
    render json: info
end
