class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :user

  validates :completed, presence: true
end
