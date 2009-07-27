Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  unless username.blank?
    visit login_url
    fill_in "login", :with => username
    fill_in "password", :with => password
    click_button "Login"
  end
end

Given /^I am not logged in$/ do
  get "/logout"
end

When /^I visit profile for "([^\"]*)"$/ do |username|
  user = User.find_by_login!(username)
  visit user_url(user)
end  