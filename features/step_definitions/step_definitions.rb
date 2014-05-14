Given(/^there are no peeps$/) do
end

When(/^I am on the homepage chitter$/) do
	visit('/')
end

Then(/^I should see no bookmarks$/) do
	expect(page).to have_content(text)
end