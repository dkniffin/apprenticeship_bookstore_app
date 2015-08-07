class LineItemsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_line_item, only: [:update, :destroy]

  def update
    @line_item.update(line_item_params)
  end
  def destroy
    @line_item.destroy
    redirect_to :back, notice: 'Book was successfully deleted from cart.' 
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
