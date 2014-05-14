Feature: Chitter 
	In order to communicate with my fellow Makers
	As a user
	I want to see peeps on a public board

	Scenario: When there are no bookmarks
		Given there are no peeps
		When I am on the homepage chitter
		Then I should see no bookmarks

	# Scenario: Entering page
	# 	Given I am on the homepage
	# 	Then I should see "sign up!"	
	# 	And I should see "Sign in"

	# Scenario: Posting
	# 	Given I log in
	# 	And post "Hello, World"
	# 	Then I want to see "Hello, World" on board
	
	# Scenario: Sign up
	# 	Given I sign up
	# 	And log in
	# 	Then I want to see board
	# 	