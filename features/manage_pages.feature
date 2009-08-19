Feature: Manage pages
  In order to create and view pages of information
  As a admin
  I want to be able to manage the pages
  Background:
    Given the following page records
        |   name   |            title                 |
        |   home   |  Welcome to Cities in Darkness   |
    Given the following user records
        |   login   |   password    | role |
        |   admin   |   secret      |  3   |
        |   bob     |   secret      |  0   |
        |   harry   |   secret      |  0   |

  Scenario: visit the home page as a non registered user
    Given I am not logged in
    And I am on "the homepage"
    Then I should see "Welcome to Cities in Darkness"
    And I should see "Recent Events"
    And I should see "Login"

 Scenario Outline: see last registered user on homepage only if logged in.

  And I am logged in as "<login>" with password "secret"
  And I am on "the homepage"
  Then I should <action>
    Examples:
          | login   |   action                                  |
          |         |   not see "Newest Member: harry"   |
          | bob     |   see "Newest Member: harry"       |

     @wip
     Scenario: create a new page as an admin
        Given I am logged in as "admin" with password "secret"
        When I follow "Admin Menu"
        Then I should see "Welcome to Admin Menu"
        And I should be on "the admin menu"