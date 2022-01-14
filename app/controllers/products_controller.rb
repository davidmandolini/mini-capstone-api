class ProductsController < ApplicationController
  def index
    info = Product.all

    render json: info
  end

  def create
    product = Product.new(
      :name => params["name"],
      :price => params["price"],
      :description => params["description"],
    )
    product.save
    render json: product.as_json
  end

  def show
    info = "Enter an ID in the URL"
    if params["id"]
      info = Product.find_by(:id => params["id"])
    end
    render json: info
  end

  def update
    product = Product.find_by(:id => params["id"])
    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.description = params["description"] || product.description
    product.img_url = params["image_url"] || product.img_url
    product.save
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(:id => params["id"])
    product.destroy
    render json: { message: "Product successfully destroyed!" }
  end
end
