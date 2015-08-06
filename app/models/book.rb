class Book < ActiveRecord::Base
  validates :title, :published_date, :author, :price, presence: true
  monetize :price_cents
end
