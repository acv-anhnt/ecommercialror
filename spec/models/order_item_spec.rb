require 'rails_helper'

RSpec.describe OrderItem, type: :model do
    context 'validation' do
        it { should validate_presence_of(:quantity) }
        it { should validate_numericality_of(:quantity).is_greater_than(0) }
    end
    context 'association' do
        it { should belong_to(:order) }
        it { should belong_to(:product) }
    end
end