class AddPostAtImageUrlColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image_url, :string
    add_column :products, :post_at, :timestamp
  end
end
