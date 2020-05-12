require 'rails_helper'

RSpec.feature 'User signs up' do
  scenario 'they can sign up for the website' do
    # Variable Setup
    user_email = 'test@test.com'
    user_password = 'password'
    user_first_name = 'Elon'
    user_last_name = 'Musk'

    # Instructions
    visit root_path
    click_on 'Sign Up'
    fill_in 'user_first_name', with: user_first_name
    fill_in 'user_last_name', with: user_last_name
    fill_in 'user_email', with: user_email
    fill_in 'user_password', with: user_password
    fill_in 'user_password_confirmation', with: user_password
    save_and_open_page
    click_on 'Sign up'

    # Asertion
    expect(page).to have_content(user_first_name)
  end
end
