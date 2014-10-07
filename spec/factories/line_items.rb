FactoryGirl.define do
  factory :line_item do
    association :product
    association :order
    quantity { 5 }
  end
end
