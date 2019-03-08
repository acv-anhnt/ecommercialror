class AddInforColumnsPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :email, :string
    add_column :payments, :telephone, :string
  end
end