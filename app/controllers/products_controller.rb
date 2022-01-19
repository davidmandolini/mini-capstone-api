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
      :supplier_id => params["supplier_id"],
    )

    if product.save
      image = Image.new(
        :url => params["image_url"],
        :product_id => product.id,
      )
      if image.save
        render json: product
      else
        render json: { errors: image.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
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
    product.supplier_id = params["supplier_id"] || product.supplier_id
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
