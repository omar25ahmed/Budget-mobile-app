require 'rails_helper'

RSpec.describe 'HomeController', type: :system do
  describe 'GET #index' do
    before(:all) do
      @user = User.create(name: 'Jane Doe', email: 'a@a', password: '123456', confirmed_at: Time.now)
    end
    it 'Check the name of the app' do
      visit root_path
      expect(page).to have_content('Transaction calculator')
    end
    it 'should have login button' do
      visit root_path
      expect(page).to have_content('Log In')
    end
    it 'should redirect_to login page' do
      visit root_path
      click_link 'Log In'
      expect(page).to have_content('Log in')
    end
    it 'should login by the form' do
      visit root_path
      click_link 'Log In'
      fill_in 'Email', with: 'a@a'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Categories')
    end
  end
end