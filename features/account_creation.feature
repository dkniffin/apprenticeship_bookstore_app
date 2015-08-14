Feature: User Account Creation
  Scenario: Happy Path
    Given I do not have an account on the site
    When I visit the site root path
    Then I am presented with a login page
    When I click "Sign up"
    And I enter my email address
    And I enter a password with correct confirmation
    And I click submit
    Then I am told to check my email for a confirmation link
    And I am sent a confirmation email
    When I visit the link in that email
    Then My email address becomes confirmed
    #And I am redirected to the book index page

  Scenario: Invalid Password
    Given I do not have an account on the site
    When I visit the site root path
    Then I am presented with a login page
    When I click "Sign up"
    And I enter my email address
    And I enter a password with incorrect confirmation
    And I click submit
    Then I am notified that my password confirmation does not match

  Scenario: Invalid Email Format
    Given I do not have an account on the site
    When I visit the site root path
    Then I am presented with a login page
    When I click "Sign up"
    And I enter "garbage" as my email address
    And I enter a password with correct password confirmation
    And I click submit
    Then I am notified that my email address is invalid.
