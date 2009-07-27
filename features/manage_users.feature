Feature: Manage users
  In order to manage users
  As a admin
  I want to be able to manage users.

  Background:
    Given the following page records
        |name|
        |home|
  Scenario: Register new user
    Given I am on the homepage
    And I follow "Register"
    When I fill in "login" with "admin"
    And I fill in "password" with "secret"
    And I fill in "password confirmation" with "secret"
    And I fill in "email" with "admin@admin.com"
    And I press "Register"
    Then I should see "Account registered!"

  Scenario Outline: Show or hide edit profile link
    Given the following user records
      | login | password | role |
      | bob   | secret   | 1    |
      | admin | secret   | 2    |
    Given I am logged in as "<login>" with password "secret"
    When I visit profile for "<profile>"
    Then I should <action>

    Examples: 
      | login | profile | action                 |
      | admin | bob     | see "Edit Profile"     |
      | bob   | bob     | see "Edit Profile"     |
      |       | bob     | not see "Edit Profile" |
      | bob   | admin   | not see "Edit Profile" |

