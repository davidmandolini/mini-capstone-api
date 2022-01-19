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
    )
    image = Image.new(
      :url => params["image_url"],
      :product_id => product.id,
    )
    if product.save && image.save
      render json: product
    elsif image.save
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    else
      render json: { errors: image.errors.full_messages }, status: :unprocessable_entity
    end
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
    if product.save
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(:id => params["id"])
    product.destroy
    render json: { message: "Product successfully destroyed!" }
  end
end
