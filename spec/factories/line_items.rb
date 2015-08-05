FactoryGirl.define do
  factory :line_item do
    book
    quantity { rand(0..100) }
  end
end
