class ProductsController < ApplicationController
  def index
    info = Product.all

    render json: { message: info }
  end

  def show
    info = "Enter an ID in the URL"
    if params["id"]
      user_id = params["id"].to_i
      info = Product.find_by(:id => user_id)
    end
    render json: { message: info }
  end
end
