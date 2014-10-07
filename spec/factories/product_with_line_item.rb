FactoryGirl.define do
factory :product_with_line_item do
    after_create do |product|
      create(:line_item, product:product)
    end
  end
end
