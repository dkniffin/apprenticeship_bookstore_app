class Book < ActiveRecord::Base
  validates :title, :published_date, :author, presence: true
end
