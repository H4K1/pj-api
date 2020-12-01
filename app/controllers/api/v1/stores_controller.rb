class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: [ :destroy, :show, :update ]

  def index
    @stores = Store.order('created_at DESC')
    @stores = Order.where(store_id: params[:store_id]).order("created_at DESC") if params[:store_id]
    render json: @stores
  end

  def show
    render json: @store
  end

  def create
    @store = Store.new(store_params)
    @store.product_ids = Product.ids if @store.product_ids.length == 0
    if @store.save
      render json: @store, status: :created
    else
      render json: @store.errors, status: :unprocessable_entity

    end
  end

  def destroy
    if @store
      @store.destroy
    else
      render json: { store: "Not found", status: :not_found}
    end
  end

  def update
    if @store
      @store.update(store_params)
      render json: @store
    else
      render json: { store: "Not found", status: :not_found}
    end
  end

  private

  def set_store
    @store = Store.find(params[:id]) 
  end

  def store_params
    params.require(:store).permit(:name, :address, :email, :phone, product_ids:[])
  end

end
