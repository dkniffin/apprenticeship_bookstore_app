class LineItemsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_line_item, only: [:update, :destroy]

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to :back, notice: 'LineItem was successfully updated.' }
        format.json { render json: @line_item, status: :ok }
      else
        format.html { render :back }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Book was successfully deleted from cart.' }
      format.json { head :no_content }
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
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:quantity, :book_id)
    end
end
