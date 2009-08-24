Feature: Manage pages
  In order to create and view pages of information
  As a admin
  I want to be able to manage the pages

  Scenario: visit the home page as a non registered user
    Given I am not logged in
    And I am on "the homepage"
    Then I should see "Welcome to Cities in Darkness"
    And I should see "Recent Events"
    And I should see "Login"

  Scenario Outline: see last registered user on homepage only if logged in.
    Given I am logged in as "<login>" with password "secret"
    And I am on "the homepage"
    Then I should <action>
      Examples:
        | login   |   action                           |
        |         |   not see "Newest Member: harry"   |
        | bob     |   see "Newest Member: harry"       |


  Scenario: admin menu for an admin
    Given I am logged in as "admin" with password "secret"
    When I follow "Admin Menu"                                
    Then I should see "Admin Tool"
    And I should be on "the admin menu"

  Scenario: admin menu hidden for a non-admin
    Given I am logged in as "bob" with password "secret"
    Then I should not see "Admin Menu" 