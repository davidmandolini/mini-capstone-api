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

  def tv_method
    info = ""
    tv = Product.find_by(:name => "TV")
    info += "Name: #{tv.name}"
    info += "\n"
    info += "Price: $#{tv.price}"
    info += "\n"
    info += "Description: #{tv.description}"
    render json: info.as_json
  end

  def ps5_method
    info = ""
    ps5 = Product.find_by(:name => "PS5")
    info += "Name: #{ps5.name}"
    info += "\n"
    info += "Price: $#{ps5.price}"
    info += "\n"
    info += "Description: #{ps5.description}"
    render json: info.as_json
  end

  def trash_method
    info = ""
    trash = Product.find_by(:name => "Trash bin")
    info += "Name: #{trash.name}"
    info += "\n"
    info += "Price: $#{trash.price}"
    info += "\n"
    info += "Description: #{trash.description}"
    render json: info.as_json
  end
end
