class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :user

  attr_accessor :stripe_card_token

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

  def completed?
    stripe_token.present?
  end

  def charge_card
    if valid?
      charge = Stripe::Charge.create(
        :amount => total.cents,
        :currency => "usd",
        :customer => user.stripe_customer_token, # obtained with Stripe.js
        :description => "Order ##{id}"
      )
      self.stripe_token = charge.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating charge: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
