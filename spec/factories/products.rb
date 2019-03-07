FactoryBot.define do
    factory :product do
        title { Faker::Commerce.product_name }
        description { Faker::Quote.famous_last_words }
        price { Faker::Commerce.price }
        image_url { 'https://loremflickr.com/640/480/lego' }
        category { create(:category) }
        post_at { Faker::Time.between(10.days.ago, Date.today, :all) }
    end
end