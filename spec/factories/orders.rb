FactoryGirl.define do
  factory :order do
    completed { [true,false].sample }
    factory :order_with_line_items do
      transient do
        item_count 5
      end

      after(:create) do |order, evaluator|
        create_list(:line_item, evaluator.item_count, order: order)
      end
    end
  end
end
