class CartsController < ApplicationController
    def show
        @order = current_order
        @payment = Payment.new
    end
end
