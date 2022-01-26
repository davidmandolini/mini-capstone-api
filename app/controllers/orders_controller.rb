class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = Order.where(:user_id => current_user.id)
    render json: orders, include: "carted_products.product"
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

    carted_products.each do |item|
      item.status = "purchased"
      item.save
    end
    if order.save
      render json: order, include: "carted_products.product"
    else
      render json: { :message => "Error" }
    end
  end

  def show
    order = Order.find_by(:id => params[:id])
    if current_user.id == order.user_id
      render json: order, include: "carted_products.product"
    else
      render json: { :message => "You are not authorized to view this order" }
    end
  end
end
