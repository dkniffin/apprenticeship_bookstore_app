require 'byebug'
class OrdersController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders
  end

  # GET /orders/:id
  # GET /orders/:id.json
  def show
  end


  # GET /orders/:id/edit
  def edit
    if @order.completed?
      redirect_to order_url(@order), alert: 'This order has already been placed, and may not be edited.'
    else
      render :cart
    end
  end

  # PUT /orders/add_to_cart
  def add_to_cart
    li = LineItem.create(line_item_params)
    current_user.cart.add_line_item(li)

    respond_to do |format|
      if current_user.cart.save
        format.html { redirect_to books_url, notice: 'Book was added to cart.' }
        format.json { render books_url, status: :created }
      else
        format.html { redirect_to book_url(line_item_params[:book_id]) }
        format.json { render json: current_user.cart.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = current_user.orders.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:quantity, :book_id)
    end

    def order_params
      params.require(:order).permit()
    end
end
