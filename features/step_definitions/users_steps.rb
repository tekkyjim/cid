Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  visit login_url
  fill_in "login", :with => username
  fill_in "password", :with => password
  click_button "Login"
end

When /^I visit profile for "([^\"]*)"$/ do |username|
  user = User.find_by_login!(username)
  visit user_url(user)
end  