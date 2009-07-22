Feature: Manage users
  In order to manage users
  As a admin
  I want to be able to manage users
  
  Scenario: Register new user
    Given I am on the homepage
    And I follow "Register"
    When I fill in "login" with "admin"
    And I fill in "password" with "secret"
    And I fill in "password confirmation" with "secret"
    And I fill in "email" with "admin@admin.com"
    And I press "Register"
    Then I should see "Account registered!"

 Scenario: Login test
     Given the following user records
        | username | password | admin |
        | bob      | secret   | false |
        | admin    | secret   | true  |
     And I am logged in as "admin" with password "secret"
     When I visit profile for "bob"
     Then I should see "Edit Profile"



