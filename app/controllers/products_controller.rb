class ProductsController < ApplicationController

    def index
        if params[:category]
            @products = Product.where(category: params[:category]).order(:post_at).page params[:page]
          else
            @products = Product.order(:post_at).page params[:page]
        end
        @categories = Category.all
        @order_item = current_order.order_items.new
    end

    def show
        @product = Product.where(id: params[:id]).first
        @order_item = current_order.order_items.new
    end
end
