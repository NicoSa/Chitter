Feature: Chitter 
	In order to post on a public board
	As a user
	I have to be able to put in text

	Scenario: Entering page
		Given I am on the homepage
		Then I should see "sign up!"	
		And I should see "Sign in"

	# Scenario: Posting
	# 	Given I log in
	# 	And post "Hello, World"
	# 	Then I want to see "Hello, World" on board
	
	# Scenario: Sign up
	# 	Given I sign up
	# 	And log in
	# 	Then I want to see board
	# 	