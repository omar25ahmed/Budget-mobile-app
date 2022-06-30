require 'rails_helper'

RSpec.describe 'Deal', type: :system do
  describe 'GET #index' do
    before(:all) do
      User.destroy_all
      Category.destroy_all
      Deal.destroy_all
    end
    before(:each) do
      @user = User.create(name: 'Jane Doe', email: 'a@a', password: '123456', confirmed_at: Time.now)
      @category = Category.create(name: 'Sport', icon: 'icon', user_id: @user.id)
      @deal = Deal.create(name: 'Deal', amount: '100', user_id: @user.id)
      @category.deals.push(@deal)
      @deal.categories.push(@category)
      visit root_path
      click_link 'Log In'
      fill_in 'Email', with: 'a@a'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Show this category'
    end
    it 'should have title' do
      expect(page).to have_content(@category.name)
    end
    it 'should have deals amount' do
      expect(page).to have_content(@category.deals.map(&:amount).sum)
    end
    it 'should not create a new deal if no category' do
      click_link 'Add new deal'
      fill_in 'Name', with: 'New deal'
      fill_in 'Amount', with: '100'
      page.check("deal_category_id_#{@category.id}")
      sleep(5)
      click_button 'Add transaction'
      expect(page).to have_content('Deal was successfully created.')
    end
  end
end
