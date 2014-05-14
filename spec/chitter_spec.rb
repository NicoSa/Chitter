require 'spec_helper'

feature "User signs up" do

  before(:each) do
    User.create(:email => "test@test.com",
                :name => "Nico",
                :nickname => "SuperNico",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "and data is recorded" do
    expect(User.first.email).to eq ("test@test.com")
    expect(User.first.name).to eq ("Nico")
    expect(User.first.nickname).to eq ("SuperNico")
  end

  scenario "and email is taken" do
    visit ('/signup/new')
    fill_in 'email', :with => 'test@test.com'
    fill_in 'name', :with => 'Nico'
    fill_in 'nickname', :with => 'SuperNico'
    fill_in 'password', :with => 'password'
    fill_in 'password_confirmation', :with => 'password'
    expect(page).to have_content("Nickname or Email are already taken, please try again!")
  end

  scenario "and is taken to user_interface" do
    visit('sign')
    visit('/user_interface')
    expect(page).not_to have_content("Click here to sign up!")
  end

end

# feature "User signs in" do

#   before(:each) do
#     User.create(:email => "test@test.com",
#           :password => 'test',
#           :password_confirmation => 'test')
#   end

#   scenario "with correct credentials" do
#     visit '/'
#     expect(page).not_to have_content("Welcome, test@test.com")
#     sign_in('test@test.com', 'test')
#     expect(page).to have_content("Welcome, test@test.com")
#   end

#   scenario "with incorrect credentials" do
#     visit '/'
#     expect(page).not_to have_content("Welcome, test@test.com")
#     sign_in('test@test.com', 'wrong')
#     expect(page).not_to have_content("Welcome, test@test.com")
#   end

# end

# feature "User signs out" do

#   before(:each) do
#     User.create(:email => "test@test.com",
#           :password => 'test',
#           :password_confirmation => 'test')
#   end

#   scenario "while being signed in" do
#     sign_in('test@test.com', 'test')
#     click_button "Sign out"
#     expect(page).to have_content("Good bye!")
#     expect(page).not_to have_content("Welcome, test@test.com")
#   end

# end

# feature "User forgets password" do

#   before(:each) do
#     User.create(:email => "test@test.com",
#           :password => 'test',
#           :password_confirmation => 'test')
#   end

#   scenario "and demands reset" do
#     visit('/forgotten_password')
#     expect(page).to have_content("Please put in your email and we will send you a link to resetting your password!
# ")
#   end

#   scenario "puts in non-existant email" do
#     visit('/forgotten_password')
#     fill_in 'email', :with => 'wrong@email.com'
#     click_button('reset password')
#     expect(page).to have_content('This user doesn´t exist!')
#   end

# end

# feature "User tries to reset password" do

#   before(:each) do
#     User.create(:email => "test@test.com",
#           :password => 'test',
#           :password_confirmation => 'test')
#   end

#   scenario "has no valid token" do
#     visit('/reset_password/nonvalidtoken')
#     expect(page).to have_content('Token has already been used!')
#   end
# end
