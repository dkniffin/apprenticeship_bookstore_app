class AddStripeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :stripe_token, :string
    remove_column :orders, :completed
  end
end
