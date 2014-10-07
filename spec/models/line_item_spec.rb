require "spec_helper"
describe LineItem do
  describe 'Associations' do
    it { should belong_to(:cart) }
    it { should belong_to(:order) }
    it { should belong_to(:product) }
  end
 # it"should create line_item with product" do
 #    create :product_with_line_item
 #    debugger
 #  end
end
