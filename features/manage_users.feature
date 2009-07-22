Feature: Manage users
  In order to manage users
  As a admin
  I want to be able to manage users
  
  Scenario: Register new users
    Given I am on the homepage
    And I follow "Register"
    When I fill in "login" with "admin"
    And I fill in "password" with "secret"
    And I fill in "password_confirmation" with "secret"
    And I fill in "email" with "admin@admin.com"
    And I press "Create"



