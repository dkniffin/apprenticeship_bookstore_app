class LineItemsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_line_item, only: [:update, :destroy]

  def update
    if @line_item.update(line_item_params)
      redirect_to :back, notice: 'LineItem was successfully updated.'
    else
      render :back
    end
  end
  def destroy
    @line_item.destroy
    redirect_to :back, notice: 'Book was successfully deleted from cart.'
  end

  # PUT /orders/add_to_cart
  def add_to_cart
    li = LineItem.create(line_item_params)
    current_user.cart.add_line_item(li)

    if current_user.cart.save
      redirect_to books_url, notice: 'Book was added to cart.'
    else
      redirect_to book_url(line_item_params[:book_id])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:quantity, :book_id)
    end
end
