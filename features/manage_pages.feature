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

 Scenario Outline: see last registered user on homepage only if logged in.
  Given the following user records
    |   login   |   password    |
    |   bob     |   secret      |
    |   harry   |   secret      |
  And I am logged in as "<login>" with password "secret"
  And I am on "the homepage"
  Then I should <action>
    Examples:
          | login   |   action                                  |
          |         |   not see "Newest Member: harry"   |
          | bob     |   see "Newest Member: harry"       |
