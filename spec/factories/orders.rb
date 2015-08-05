FactoryGirl.define do
  factory :order do
    completed { [true,false].sample }
    factory :open_order do
      completed false
    end
  end
end
