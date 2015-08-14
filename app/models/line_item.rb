class LineItem < ActiveRecord::Base
  belongs_to :book, :counter_cache => :order_count
  belongs_to :order

  validates :quantity, :book, presence: true

  def price
    book.price * quantity
  end
end
