class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy, :items, :add_product, :empty, :remove_product]
  before_action :check_line_items_params, only: [:add_product]

  # GET /carts
  def index
    @carts = Cart.where(user_id: params[:user_id])

    render json: @carts
  end

  # GET /carts/1
  def show
    render json: @cart
  end

  # GET /carts/1/items
  def items
    render json: @cart.line_items
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render json: @cart, status: :created, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  def add_product
    @line_item = @cart.add_product(params[:product_id], params[:price], params[:quantity])

    if @line_item.save
      render json: @line_item, status: :created, location: @cart
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
  end

  def remove_product
    @cart.line_items.where(product_id: params[:product_id]).destroy_all
  end

  # DELETE /carts/1
  def empty
    @cart.line_items.destroy_all
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.require(:cart).permit(:user_id)
    end

    def check_line_items_params
      %w(product_id price).each { |param| params.require(param) }
    end
end
