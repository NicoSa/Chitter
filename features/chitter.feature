Feature: Chitter 
	In order to communicate with my fellow Makers
	As a user
	I want to see peeps on a public board

	Scenario: When there are no bookmarks
		Given there are no peeps
		When I am on the homepage chitter
		Then I should see no bookmarks

	Scenario: Posting
		Given I log in with my credentials
		And post "Hello, World"
		Then I want to see "Hello, World" in user interface

	Scenario: Signup
	 	Given I am signing up
	 	Then I should see "Welcome"	

	Scenario: Signup with taken email or nickname
		Given I am signing up 
		And the email and namen is already taken
		Then I should see "Nickname or Email are already taken!"
	
	Scenario: Signout 
		Given I sign out
		And I had posted "Hello, World"
		Then I should see "Hello, World" on the homepage

	Scenario: Wrong Login
		Given I login without having signed up
		Then I should see "Wrong credentials"

	Scenario: Forget Password
		Given I forget my password
		And require a new one
		Then I should see "Please check your email!"

	Scenario: Reset Password
		Given I reset my password
		Then I should see "All done, you can login with your new password now"

