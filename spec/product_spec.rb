require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with name, price, quantity, and category attributes" do
      @product = Product.new(name: "Prod name", price: 1000, quantity: 5, category: Category.new())
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to match_array([])
    end
    
    it "is not valid with name missing" do
      @product = Product.new(name: nil, price: 1000, quantity: 5, category: Category.new())
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    
    it "is not valid with price missing" do
      @product = Product.new(name: "Prod name", price_cents: nil, quantity: 5, category: Category.new())
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    
    it "is not valid with quantity missing" do
      @product = Product.new(name: "Prod name", price: 1000, quantity: nil, category: Category.new())
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    
    it "is not valid with category missing" do
      @product = Product.new(name: "Prod name", price: 1000, quantity: 5, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end