class AddOrderAtColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_at, :timestamp
  end
end
