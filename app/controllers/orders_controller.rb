class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    user = User.find_by(:id => current_user.id)
    orders = user.orders
    render json: orders
  end

  def create
    order = Order.new(
      :user_id => current_user.id,
    )
    carted_products = CartedProduct.where(:user_id => current_user.id, :status => "carted")
    order.subtotal = 0
    carted_products.each do |item|
      order.subtotal += item.product.price * item.quantity
    end
    order.tax = 0.09 * order.subtotal
    order.total = order.subtotal + order.tax
    if order.save
      render json: order
    else
      render json: { :message => "Error" }
    end
  end

  def show
    order = Order.find_by(:id => params[:id])
    if current_user.id == order.user_id
      render json: order
    else
      render json: { :message => "You are not authorized to view this order" }
    end
  end
end
