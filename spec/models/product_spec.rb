require "spec_helper"

describe Product do

  describe 'Associations' do
    it { should have_many(:line_items) }
  end

  describe 'Database Columns' do
    it { should have_db_column(:title).of_type(:string)}
  end

  it "has valid factory" do
    create(:product).should be_valid
  end

  it "has valid invalid factory" do
    build(:invalid_product).should_not be_valid
    debugger
  end

  it "is invalid without title" do
    build(:product, title: nil).should_not be_valid
  end

  it "is invalid without description" do
    build(:product, description: nil).should_not be_valid
  end

  it "is valid with .jpg, .gif or .png" do
    build(:product).should be_valid
  end

  it "is invalid without image_url" do
    build(:product, image_url: nil).should_not  be_valid
  end

  it "has numeric price" do
    build(:product, price: 25.00).should_not be_kind_of(String)
  end

  it "#product_with_image" do
    p = create(:product)
    p.product_with_image.should eq("#{p.title} #{p.description}")
  end

  it ".check_price" do
    described_class.check_price.should eq "class_method"
  end

  it "destroy product if line_items empty" do
    pr = create :product
             # pr.line_items.destroy
             # pr.save
             # debugger
    expect{pr.destroy}.to change(Product, :count).by(-1)

  end

  it "should return error if line_items present" do
    line_item = create :line_item
    pr = line_item.product
    # debugger
    expect{ pr.destroy }.to change(Product, :count).by(0)
    errors = pr.errors.messages[:base]
    # debugger
    errors.should eq(["Line Items present"])
  end

  it "has line_item" do
    create(:product).line_items.count.should eq 1
  end

  describe 'scopes' do
    it 'default scope' do
      described_class.all.to_sql.should include("ORDER BY \"products\".\"title\" ASC")
    end
  end
end
