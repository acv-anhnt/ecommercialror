require 'rails_helper'

RSpec.describe Order, type: :model do
    context 'validation' do
      it { should validate_presence_of(:order_at)}
      it { should validate_presence_of(:status)}
    end
    context 'association' do
      it { should have_many(:order_items) }
      it { should belong_to(:user)}
    end
end

