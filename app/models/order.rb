class Order < ApplicationRecord
  has_many :order_items
  has_many :payments
  belongs_to :user
  validates :order_at, :status, presence: true
  has_one :payment
  def total_price
    order_items.collect { |item| item.valid? ? (item.quantity*item.product.price) : 0 }.sum
  end

  def total_ammount
    order_items.collect { |item| item.valid? ? (item.quantity) : 0 }.sum
  end
  private
    def set_order_status
      self.status = 1
    end

    def update_total
      self.total = total_price
    end
end