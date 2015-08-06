class AddDescriptionAndPriceToBooks < ActiveRecord::Migration
  def change
    add_column :books, :description, :string
    add_money :books, :price
  end
end
