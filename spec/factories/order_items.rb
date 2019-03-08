FactoryBot.define do
    factory :order_item do
        order_at { Faker::Time.between(10.days.ago, Date.today, :all) }
        quantity { Faker::Number.between(1, 100) }
        order { create(:order) }
        product { create(:product) }
    end
end