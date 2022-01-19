require 'rails_helper'

RSpec.describe Category, type: :model do

  let!(:category) {Category.new}
  
  context 'Validations' do
    it '1. Is not valid without name' do
        category.name = nil

    expect(category).to_not be_valid
    expect(category.errors).to be_present
    end

    it '2. Category should not have special characters' do

        category.name = "!@#$%^&*"

    expect(category).to_not be_valid
    expect(category.errors).to be_present
    end

    
    it '3. Category should not have same name' do

      category.name = "Apple"
      category.name = "Apple"

  expect(category).to_not be_valid
  expect(category.errors).to be_present
  end
  
  end

end
