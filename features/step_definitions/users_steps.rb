Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  visit login_url
  fill_in "Username", :with => username
  fill_in "Password", :with => password
  click_button "Log in"
end

When /^I visit profile for "([^\"]*)"$/ do |username|
  user = User.find_by_username!(username)
  visit user_url(user)
end  