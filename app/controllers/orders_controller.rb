require 'byebug'
class OrdersController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = orders
  end

  # GET /orders/:id
  # GET /orders/:id.json
  def show
  end


  # GET /orders/:id/edit
  def edit
  end

  # PUT /orders/add_to_cart
  def add_to_cart
    li = LineItem.create(line_item_params)
    cart.add_line_item(li)

    respond_to do |format|
      if cart.save
        format.html { redirect_to books_url, notice: 'Book was added to cart.' }
        format.json { render books_url, status: :created }
      else
        format.html { redirect_to book_url(line_item_params[:book_id]) }
        format.json { render json: @last_order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def orders
      current_user.orders
    end
    def last_order
      orders.last
    end
    def cart
      if last_order.nil? || last_order.completed?
        orders << Order.new({completed: false})
      end
      last_order
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = orders.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:quantity, :book_id)
    end

    def order_params
      params.require(:order).permit()
    end
end
