class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  has_many :orders

  def cart
    if last_order.nil? || last_order.completed?
      orders << Order.new
    end
    last_order
  end

  private
    def last_order
      orders.last
    end
end
