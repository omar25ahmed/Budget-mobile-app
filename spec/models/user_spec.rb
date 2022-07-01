require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'Jane Doe', email: 'a@a', password: '123456', confirmed_at: Time.now)
      @category = Category.create(name: 'Sport', icon: 'icon', user_id: @user.id)
    end
    it 'should be valid' do
      expect(@user).to be_valid
    end
    it 'should not be valid without name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end
    it 'should not be valid without email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it 'should not be valid without password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end
  end
end
