require 'rails_helper'

describe 'As a user' do
  describe 'when I visit /' do
    it "allows me to create an account" do
      
      visit '/'
      click_link "Create Account"

      expect(current_path).to eq(new_user_path)

      user_name = "firstname lastname"
      user_email = "name@email.com"
      user_password = "password"

      fill_in :user_name, with: user_name
      fill_in :user_email, with: user_email
      fill_in :user_password, with: user_password

      click_button 'Create User'

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content(user_name)
      
    end
  end
end