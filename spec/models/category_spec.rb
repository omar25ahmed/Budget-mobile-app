require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'Jane Doe', email: 'a@a', password: '123456', confirmed_at: Time.now)
      @category = Category.create(name: 'Sport', icon: 'icon', user_id: @user.id)
    end
    it 'should be valid' do
      expect(@category).to be_valid
    end
    it 'should not be valid without name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end
    it 'should not be valid without icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end
end