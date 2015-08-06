FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    price_cents { rand(100..1000) }
    description { Faker::Lorem.paragraphs(rand(1..3)).join }

    category { Faker::Book.genre }
    published_date do
       rand_days = rand(15340) # 42 years
       rand_days.days.ago.to_date
    end
    factory :one_dollar_book do
      price_cents { 100 }
    end
  end
end
