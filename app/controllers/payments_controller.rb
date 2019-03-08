class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show]
  protect_from_forgery except: [:hook]
  def index
    @payments = Payment.all.order(:id).page params[:page]
  end

  def new
  end

  def show
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to @payment.paypal_url(payment_url(@payment), 'https://23ea9538.ngrok.io/hook')
    else
      render :new
    end
  end


  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]

    if status == "Completed"
      @payment = Payment.where(id: params[:invoice]).first
      @payment.update_attributes!(status: status, purchased_at: Time.now)
    end
    render nothing: true
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.where(id: params[:id]).first
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def payment_params
    params.require(:payment).permit(:order_id, :full_name, :company, :email, :telephone)
  end
  
end
