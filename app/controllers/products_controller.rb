class ProductsController < ApplicationController
  def all_products_method
    info = ""
    Product.all.each do |item|
      info += "Name: #{item.name}"
      info += "\n"
      info += "Price: $#{item.price}"
      info += "\n"
      info += "Description: #{item.description}"
      info += "\n\n\n"
    end
    render json: info.as_json
  end

  def product_method
    info = "Enter an ID in the URL"
    if params["id"]
      user_id = params["id"].to_i
      product = Product.find_by(:id => user_id)
      info = "Name: #{product.name}"
      info += "\n"
      info += "Price: $#{product.price}"
      info += "\n"
      info += "Description: #{product.description}"
    end
    render json: info.as_json
  end
end
