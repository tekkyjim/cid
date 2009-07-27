Feature: Manage pages
  In order to create and view pages of information
  As a admin
  I want to be able to manage the pages
  Background:
    Given the following page records
        |   name   |            title                 |
        |   home   |  Welcome to Cities in Darkness   |
  Scenario: visit the home page as a non registered user
    Given I am not logged in
    And I am on "the homepage"
    Then I should see "Welcome to Cities in Darkness"
    And I should see "Recent Events"
    And I should see "Login"