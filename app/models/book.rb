class Book < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items

  validates :title, :published_date, :author, :price, presence: true
  monetize :price_cents
end
