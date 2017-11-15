require 'rails_helper'

RSpec.feature "Visitor navigates to a product detail page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

      @product = @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  

  scenario "they click on a product" do
    
    visit root_path

    puts page.html

    # first('footer').click_link('details-button')
    # click_link('Details &raquo;')
    first('.product-image').click

    expect(page).to have_current_path(product_path @product.id)
    # expect(page).to have_current_path(product_path (@product.id))
    

    save_screenshot
  end


end
