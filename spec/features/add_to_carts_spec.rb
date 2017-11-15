## bin/rails s -b 0.0.0.0

require 'rails_helper'

RSpec.feature "Visitor can add a product on the home page to their cart", type: :feature, js: true do
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
  

  scenario "they click the add cart button for a product and their cart increases" do

    visit root_path

    puts page.html

    first('.add-button').click

    sleep(6)

    expect(page).to have_link("My Cart (1)")
    
    save_screenshot
  end
end
