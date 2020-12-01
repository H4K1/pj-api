class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [ :destroy, :show, :update ]

  def index
    @products = Product.order('created_at DESC')

    render json: @products
  end


  def show
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity

    end
  end

  def destroy
    if @product
      @product.destroy
    else
      render json: { product: "Not found", status: :not_found}
    end
  end

  def update
    if @product
      @product.update(product_params)
      render json: @product
    else
      render json: { product: "Not found", status: :not_found}
    end
  end

  private

  def set_product
    @product = Product.find(params[:id]) 
  end

  def product_params
    params.require(:product).permit(:name, :sku, :type, :price)
  end

end
