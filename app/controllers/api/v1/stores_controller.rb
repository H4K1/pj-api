class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: [ :destroy, :show, :update ]

  def index
    @stores = Store.order('created_at DESC')
    render :index
  end

  def show
    render :show
  end

  def create
    @store = Store.new(store_params)
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
