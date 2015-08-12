class AddAddressesToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_address, :string
    add_column :orders, :billing_address, :string
  end
end
