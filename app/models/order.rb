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
    ! stripe_token.nil?
  end

  def save_with_payment
    if valid?
      puts "CARD TOKEN = #{stripe_card_token}"
      charge = Stripe::Charge.create(
        :amount => total.cents,
        :currency => "usd",
        :source => stripe_card_token, # obtained with Stripe.js
        :description => "Order ##{id}"
      )
      self.stripe_token = charge.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
