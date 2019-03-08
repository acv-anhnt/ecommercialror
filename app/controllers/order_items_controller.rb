class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    if @order.save
      session[:order_id] = @order.id
    else
      # iplement flash message
    end
  end
  def update
    @order = current_order
    @order_item = @order.order_items.where(id: params[:id]).first
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    redirect_to carts_path
  end
  def destroy
    @order = current_order
    @order_item = @order.order_items.where(id: params[:id]).first
    @order_item.destroy
    @order_items = @order.order_items
    redirect_to carts_path
  end
  private
    def order_item_params
        params.require(:order_item).permit(:quantity, :product_id)
    end
end
