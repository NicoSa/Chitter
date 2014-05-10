Feature: Chitter 
	In order to use Chitter
	As a user
	I have to be able to sign up, log in and post

	Scenario: Entering page
		Given I go to Chitter 
		Then I should see "Sign up"	
		And I should see "Log in"

	Scenario: Sign up
		Given I sign up
		And log in
		Then I want to see board
		

	Scenario: Posting
		Given I log in
		And post "Hello, World"
		Then I want to see "Hello, World" on board
