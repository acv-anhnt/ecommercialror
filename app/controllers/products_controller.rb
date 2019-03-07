class ProductsController < ApplicationController
    def index
        @products = Product.order(:post_at).page params[:page]
    end

    def show
        @product = Product.find(params[:id])
    end
end