require 'rails_helper'

RSpec.describe CartsController, type: :controller do
    let!(:order) { create(:order) }
    login_user

    describe 'GET #show' do
      before { get :show, params: { id: order.id } }
      it 'gets the cart for detail' do
      expect(assigns(:order)).to eq order
      end

      it 'get the show template' do
      expect(response).to render_template :show
      end
    end
end