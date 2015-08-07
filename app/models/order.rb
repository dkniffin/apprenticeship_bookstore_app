class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :user

  validates_inclusion_of :completed, in: [true, false]

  def add_line_item(line_item)
    line_items << line_item
  end

  def total
    if line_items.length == 0
      Money.new(0)
    else
      line_items.map{|li| li.price}.reduce(:+)
    end
  end
end
