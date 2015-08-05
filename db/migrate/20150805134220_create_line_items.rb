class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity, null: false
      t.belongs_to :book, index:true, null: false
      t.belongs_to :order, index:true

      t.timestamps null: false
    end
  end
end
