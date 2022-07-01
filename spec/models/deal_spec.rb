require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'Jane Doe', email: 'a@a', password: '123456', confirmed_at: Time.now)
      @category = Category.create(name: 'Sport', icon: 'icon', user_id: @user.id)
      @deal = Deal.create(name: 'Deal', amount: '100', user_id: @user.id)
    end
    it 'should be valid' do
      expect(@deal).to be_valid
    end
    it 'should not be valid without name' do
      @deal.name = nil
      expect(@deal).to_not be_valid
    end
    it 'should not be valid without amount' do
      @deal.amount = nil
      expect(@deal).to_not be_valid
    end
  end
end
