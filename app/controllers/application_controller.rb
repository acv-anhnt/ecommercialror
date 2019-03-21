class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protect_from_forgery with: :exception
    helper_method :current_order

    def current_order
        if session[:order_id].present?
            Order.where(id: session[:order_id]).first
        else
            Order.new(user: current_user, status: 1, order_at: Time.new)
        end
    end
end
