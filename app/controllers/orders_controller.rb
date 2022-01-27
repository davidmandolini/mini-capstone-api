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
    if order.save
      carted_products.each do |item|
        item.status = "purchased"
        item.order_id = order.id
        item.save
      end
      order.perform_calculations
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
