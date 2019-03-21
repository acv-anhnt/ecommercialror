class RemoveQuantityDeletedExpire < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :expires_at
    remove_column :payments, :quantity
    remove_column :payments, :deleted_at
  end
end
