class ProductsController < ApplicationController
  def index
    info = Product.all

    render json: { message: info }
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
    render json: { message: info }
  end
end
