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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:quantity, :book_id)
    end
end
