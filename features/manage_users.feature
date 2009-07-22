Feature: Manage users
  In order to manage users
  As a admin
  I want to be able to manage users.
  
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
        | login | password | role |
        | bob      | secret   | 1 |
        | admin    | secret   | 2  |
     And I am logged in as "admin" with password "secret"
     When I visit profile for "bob"
     Then I should see "Edit Profile"



