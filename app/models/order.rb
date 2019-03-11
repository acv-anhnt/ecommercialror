class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  validates :order_at, :status, presence: true

  def total_price
      order_items.collect { |item| item.valid? ? (item.quantity*item.product.price) : 0 }.sum
  end
  private
    def set_order_status
      self.status = 1
    end

    def update_total
      self.total = total_price
    end
end