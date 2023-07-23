require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.new(name: "Furniture")
    @category.save
  end

  describe '#save' do
    it 'ensures a product with all four fields set will save' do
  
      @product = Product.new(name: "cat", price: 8838, quantity: 45, category: @category)
      @product.save
      expect(@product).to be_valid
    end
  
    it 'should not create a product if a name does not exist' do
      @product = Product.new(name: nil, price: 8838, quantity: 45, category: @category)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
  
    it 'should not create a product if a price does not exist' do
      @product = Product.new(name: "Chair", price_cents: nil, quantity: 5, category: @category)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price is not a number") # This should be the error message for missing price_cents
    end

    it 'should not create a product if a quantity does not exist' do
      @product = Product.new(name: "Chair", price: 4000, quantity: nil, category: @category)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not create a product if a category does not exist' do
      @product = Product.new(name: "Chair", price: 4000, quantity: 6, category: nil)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end

