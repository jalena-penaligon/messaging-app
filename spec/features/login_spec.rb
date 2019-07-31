require 'rails_helper'

RSpec.describe 'user login', type: :feature do
  describe 'as a visitor' do
    describe 'when I visit the root path' do
      it 'has a form to login' do
        user = User.create(email: "email@email.com", password: "password")
        visit '/'
        fill_in :email, with: user.email
        fill_in :password, with: user.password
        click_button "Login"

        expect(page).to have_content("Logged in as #{user.email}")
      end

      it 'will not allow a user to login with invalid credentials' do
        user = User.create(email: "email@email.com", password: "password")
        visit '/'
        fill_in :email, with: user.email
        fill_in :password, with: "invalid-password"
        click_button "Login"

        expect(page).to have_content("Error: Looks like your email or password is invalid.")
      end
    end
  end

  describe 'as a logged in user' do
    describe 'when I visit the root path' do
      it 'has a link to logout' do
        user = User.create(email: "email@email.com", password: "password")
        visit '/'
        fill_in :email, with: user.email
        fill_in :password, with: user.password
        click_button "Login"

        click_link "Log Out"

        expect(page).to have_content("Login")
      end
    end
  end
end
