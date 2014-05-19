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
    click_on('Sign up')
    expect(page).not_to have_content("Welcome Nico")
  end

  scenario "and is taken to user_interface" do
    visit('/user_interface')
    expect(page).to have_content("Click here to sign up!")
  end

end

feature "User signs in" do

  before(:each) do
    User.create(:email => "test@test.com",
                :name => "Nico",
                :nickname => "SuperNico",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "with correct credentials" do
    visit ('/')
    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => 'test'
    click_on('Sign in')
    expect(page).to have_content("Cheet   ")
  end

  scenario "with incorrect credentials" do
    visit ('/')
    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => 'wrongpassword'
    click_on('Sign in')
    expect(page).to_not have_content("Welcome Nico")
  end

  scenario "posts and checks board after signout" do
    visit ('/')
    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => 'test'
    click_on('Sign in')
    fill_in 'message', :with => 'Hello Chitter!'
    click_on('Cheet')
    expect(page).to have_content("Hello Chitter!")
    click_on('Sign out')
    expect(page).to have_content("Hello Chitter!")
  end

  scenario "posts and checks board" do
    visit ('/')
    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => 'test'
    click_on('Sign in')
    fill_in 'message', :with => 'Hello Chitter!'
    click_on('Cheet')
    expect(page).to have_content("Hello Chitter!")
    expect(page).to have_content("Nico")
    expect(page).to have_content("SuperNico")
  end

end

feature "User signs out" do

  before(:each) do
    User.create(:email => "test@test.com",
                :name => "Nico",
                :nickname => "SuperNico",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "while being signed in" do
    visit ('/')
    # save_and_open_page <<-- launchy ! ! 
    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => 'test'
    click_on('Sign in')
    click_on('Sign out')
    expect(page).to_not have_content("Welcome Nico")
  end

end

feature "User forgets password" do

  before(:each) do
    User.create(:email => "test@nicosaueressig.com",
                :name => "Nico",
                :nickname => "SuperNico",
                :password => 'test',
                :password_confirmation => 'test')
    User.stub(:send_recovery_email).and_return("Send without Errors, stub!")
  end

  scenario "and demands reset" do
    visit('/forgotten_password')
    expect(page).to have_content("Please put in your email and we will send you a link to resetting your password!
")
  end

  scenario "puts in non-existant email" do
    visit('/forgotten_password')
    fill_in 'email', :with => 'wrong@email.com'
    click_on('Reset Password')
    expect(page).to have_content('User doesn´t exist')
  end

  scenario "requests reset an token is created" do
    visit('/forgotten_password')
    fill_in 'email', :with => 'test@nicosaueressig.com'
    click_on('Reset Password')
    expect(User.first.password_token.length).to eq 64
  end

end

feature "User tries to reset password" do

  before(:each) do
    User.create(:email => "test@test.com",
                :name => "Nico",
                :nickname => "SuperNico",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "has no valid token" do
    visit('/reset_password/nonvalidtoken')
    expect(page).to have_content('Token has already been used...')
  end

end


