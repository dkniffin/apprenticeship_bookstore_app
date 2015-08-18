class OrdersController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :destroy, :place_order, :confirm_order]

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

  # PUT /orders/:id/place_order
  def place_order
    if @order.user.stripe_customer_token.nil?
      @order.user.stripe_card_token = params[:user][:stripe_card_token]
      @order.user.save_card
    end
    @order.user.update(user_params)
    render :confirmation
  end

  # PUT /orders/:id/confirm_order
  def confirm_order
    if @order.charge_card
      OrderMailer.order_invoice(current_user,@order).deliver_now
      redirect_to @order, notice: "Your order has been placed!"
    else
      redirect_to @order, alert: "There was an error with placing your order: #{@order.errors.full_messages.to_sentence}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = current_user.orders.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:billing_address, :shipping_address)
    end


    def order_params
      params.require(:order).permit()
    end
end
