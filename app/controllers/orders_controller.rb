class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [ :destroy, :show, :update ]

  def index
    @orders = Order.order('created_at DESC')

    render json: @orders
  end


  def show
    render json: @order
  end

  def create
    @order= Order.new(order_params)
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity

    end
  end

  def destroy
    if @order
      @order.destroy
    else
      render json: { order: "Not found", status: :not_found}
    end
  end

  def update
    if @order
      @order.update(order_params)
      render json: @order
    else
      render json: { order: "Not found", status: :not_found}
    end
  end

  private

  def set_order
    @order = Order.find(params[:id]) 
  end

  def order_params
    params.require(:order).permit(:store_id)
  end

end
