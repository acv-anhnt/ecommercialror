FactoryBot.define do
    factory :order do
        order_at { Faker::Time.between(10.days.ago, Date.today, :all) }
        status { Faker::Number.between(1, 3) }
        user { create(:user) }
    end
end