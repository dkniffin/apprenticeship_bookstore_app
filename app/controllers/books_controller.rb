class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /books
  # GET /books.json
  def index
    order = params[:sort] || 'published_date'
    order = 'order_count' if order == 'popularity'

    @q = Book.order(order).ransack(params[:q])

    @books = @q.result.page params[:page]
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :published_date, :author, :category, :description, :price)
    end
end
