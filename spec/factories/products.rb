FactoryGirl.define  do
  factory :product, aliases: [:author] do
    title { Faker::Name.title }
    description { Faker::Lorem.sentence }
    price "25.00"
    sequence(:image_url) { |n| "person#{n}.jpg" }
    # trait :cheap do
    # end

    # trait :costly do
    #   price "3000"
    # end
    # after_create do |product|
    #   FactoryGirl.create(:line_item, product: product)
    # end

  end

  factory :invalid_product, class: :product  do
    title nil
    price nil
    description nil
    image_url nil
  end

  # factory :line_item do
  #   quantity { 5 }
  #   product
  # end
end
