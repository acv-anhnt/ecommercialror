class AddQuantityColumOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :quantity, :decimal
  end
end
