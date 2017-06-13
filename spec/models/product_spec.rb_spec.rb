require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is successful when all fields present" do
      @category = Category.new
      @product = Product.new ({name: 'Happy Unicorn Sweater', price: 200, quantity: 1, category: @category})
      @product.save
      expect(@product.save).to be_present
    end

    it "has a name" do
      @category = Category.new
      @product = Product.new ({name: nil, price: 200, quantity: 3, category: @category})
      @product.save
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "has a price" do
      @category = Category.new
      @product = Product.new ({name: 'Happy Unicorn Sweater', price: nil, quantity: 1, category: @category})
      @product.save
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "has a quantity" do
      @category = Category.new
      @product = Product.new ({name: 'Happy Unicorn Sweater', price: 200, quantity: nil, category: @category})
      @product.save
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "has a category" do
      @product = Product.new ({name: 'Happy Unicorn Sweater', price: 200, quantity: 1, category: nil})
      @product.save
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

  end
end
