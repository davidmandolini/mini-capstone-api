class OrdersController < ApplicationController
  def index
    if current_user
      user = User.find_by(:id => current_user.id)
      orders = user.orders
      render json: orders
    else
      render json: { :message => "You are not authorized to view this page." }
    end
  end

  def create
    product = Product.find_by(:id => params[:product_id])
    order = Order.new(
      :user_id => current_user.id,
      :product_id => params[:product_id],
      :quantity => params[:quantity],
    )
    order.subtotal = product.price * order.quantity
    order.tax = product.tax * order.quantity
    order.total = order.subtotal + order.tax
    if order.save
      render json: order
    else
      render json: { :message => "Error" }
    end
  end

  def show
    order = Order.find_by(:id => params[:id])
    if current_user && current_user.id == order.user_id
      render json: order
    else
      render json: { :message => "You are not authorized to view this order" }
    end
  end
end
