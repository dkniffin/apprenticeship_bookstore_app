class MoveStripeToUsers < ActiveRecord::Migration
  def change
    add_column :orders, :completed, :boolean
    add_column :users, :stripe_customer_token, :string
  end
end
