class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  validates :email, :presence => true, :email => true

  has_many :orders

  attr_accessor :stripe_card_token

  def cart
    if last_order.nil? || last_order.completed?
      orders << Order.new
    end
    last_order
  end

  def save_card
    if valid?
      customer = Stripe::Customer.create(
        :source => stripe_card_token, # obtained with Stripe.js
        :description => "#{email}"
      )
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  private
    def last_order
      orders.last
    end
end
