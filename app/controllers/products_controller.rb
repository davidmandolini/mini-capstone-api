class ProductsController < ApplicationController
  def index
    products = Product.all

    render json: products
  end

  def create
    product = Product.new(
      :name => params["name"],
      :price => params["price"],
      :description => params["description"],
      :img_url => params["image_url"],
    )
    product.save
    render json: product
  end

  def show
    product = Product.find_by(:id => params["id"])
    render json: product
  end

  def update
    product = Product.find_by(:id => params["id"])
    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.description = params["description"] || product.description
    product.img_url = params["image_url"] || product.img_url
    product.save
    render json: product
  end

  def destroy
    product = Product.find_by(:id => params["id"])
    product.destroy
    render json: { message: "Product successfully destroyed!" }
  end
end
