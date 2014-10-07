require "spec_helper"
describe Product do
  it 'visit order page' do
    visit '/'
    page.should have_content('Your Pragmatic Catalog')

    click_link 'Products'
    page.should have_content('Listing products')
  end
  it "clicks on add_to_cart button"  do

  end
end
