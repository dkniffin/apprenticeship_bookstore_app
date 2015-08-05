class LineItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order

  validates :quantity, :book, presence: true
end
