require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      @product = Product.new(name: "Prod name", price: 1000, quantity: 5, category: Category.new())
      expect(@product).to be_valid
    end
    
    it "is not valid with name missing" do
      @product = Product.new(name: nil, price: 1000, quantity: 5, category: Category.new())
      expect(@product).to_not be_valid
    end

    it "is not valid with price missing" do
      @product = Product.new(name: "Prod name", price_cents: nil, quantity: 5, category: Category.new())
      expect(@product).to_not be_valid
    end

    it "is not valid with quantity missing" do
      @product = Product.new(name: "Prod name", price: 1000, quantity: nil, category: Category.new())
      expect(@product).to_not be_valid
    end

    it "is not valid with category missing" do
      @product = Product.new(name: "Prod name", price: 1000, quantity: 5, category: nil)
      expect(@product).to_not be_valid
    end

  end
end