require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before(:each) do
      @category = Category.new
      @product = Product.new(name: 'Xylophone', price_cents: 10, quantity: 9, category: @category)
    end
    
    it "should be valid" do
      expect(@product).to be_valid
    end

    it "has a valid name" do
      @product.name = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
      # puts @product.errors.full_messages
    end
    
    it "has a valid price" do
      @product.price_cents = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages.length).to be >= 0
      puts @product.errors.full_messages
      
    end
    
    it "has a valid quantity" do
      @product.quantity = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end
    
    it "has a valid category" do
      @product.category = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq ["Category can't be blank"]
    end

  end

  # describe 'TestErrors' do 

  #   before(:each) do 
  #     @product = Product.new
  #   end

  #   it "should give errors" do
  #     @product.save
  #     expect(@product.errors.full_messages.length).to be >= 0
  #     puts @product.errors.full_messages
  #   end
  # end
end
