class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [ :destroy, :show, :update ]

  def index
    @orders= Order.order('created_at DESC')
    @orders = Store.find(params[:store_id]).orders.order("created_at desc") if params[:store_id]

    render json: @orders
  end


  def show
    render json: @order
  end

  def create
    @order= Order.new(order_params)
    @order.total = @order.product_ids.map{|x| Product.find(x).price}.sum
    products = ''
    if @order.save

      @order.products.map{|x| x.name}.each{|order| products += "<li>#{order}</li>"}

      html = "
      <h1>Orden generada correctamente</h1>
      <p>
        <b>Nombre local: </b> <span>#{@order.store.name}</span> 
      </p>
      <p>
        <b>Hora del pedido: </b> <span>#{@order.created_at.strftime("%H:%M")}</span> 
      </p>

      <p>
        <b>Detalle: </b> <ul>#{products}</ul>
      </p>

      <hr>

      <p>
        <b>Total: </b> <span>#{@order.total.to_s + " CLP"}</span>
      </p>

      "

      send_order(@order, @order.store.email, html )


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
      @order.total = @order.product_ids.map{|x| Product.find(x).price}.sum
      render json: @order
    else
      render json: { order: "Not found", status: :not_found}
    end
  end

  private

  def set_order
    @order= Order.find(params[:id]) 
  end

  def getProducts

  end

  def order_params
    params.require(:order).permit(:store_id, product_ids:[])
  end

end
