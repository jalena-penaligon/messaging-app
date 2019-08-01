require 'rails_helper'

RSpec.describe 'messages spec', type: :feature do
  describe 'as a logged in user' do
    describe 'when I visit the root path' do
      it 'has a form to type and send a message' do
        user_1 = User.create(email: "user1@email.com", password: "password")
        user_2 = User.create(email: "user2@email.com", password: "password")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

        visit '/'
        fill_in :message_content, with: "This is my first message"
  
        click_button "Send"
        visit '/'
        within '#messages' do
          expect(page).to have_content(user_1.email)
          expect(page).to have_content("This is my first message")
        end
      end
    end
  end
end
