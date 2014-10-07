FactoryGirl.define do
  factory :order do
    name { Faker::Name.name }
    address "dasdsa"
    email "esc@jj.com"
    pay_type "check"
  end
end
