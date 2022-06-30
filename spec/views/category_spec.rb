require 'rails_helper'

RSpec.describe 'CategoryController', type: :system do
  describe 'categories functionality' do
    before(:all) do
      User.destroy_all
      Category.destroy_all
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
    end
    it 'should have title' do
      expect(page).to have_content('Categories')
    end
    it 'should have categories' do
      expect(page).to have_content(@category.name)
    end
    it 'should add a new category' do
      click_link 'New category'
      fill_in 'Name', with: 'Football'
      fill_in 'Icon', with: 'icon'
      click_button 'Add category'
      expect(page).to have_content('Football')
    end
  end
end
