Feature: Bookstore Administration Panel
  Scenario: Admin Authentication
    Given I have an admin account
    When I visit the admin panel url
    And I enter my username
    And I enter my password
    And I click submit
    Then I see a list of books in the bookstore

  Scenario: Invalid Login
    Given I do not have an admin account
    When I visit the admin panel url
    And I enter my username
    And I enter my password
    And I click submit
    Then I see a flash notification that tell me that my email does not exist in the system

  Scenario: Adding a book
    Given I am logged into the admin panel
    When I visit the admin panel url
    And I click "Add a Book"
    And I enter the book name "Test Book"
    And I set the books price to "135.99"
    And I click "Submit"
    Then I see the book on the admin panel index
    When I visit the Bookstore public book listing
    Then I should see the book "Test Book"
    And I should see the book price "$135.99"

  Scenario: Deleting a book
    Given I am logged into the admin panel
    And there is a book named "Book To Be Deleted"
    When I visit the admin panel url
    And I click "Delete" for the book "Book To Be Deleted"
    Then I should see a prompt requesting that I confirm my decision to delete the book
    When I confirm my decision to delete the book
    Then I should not see "Book To Be Deleted"
    When I visit the Bookstore public book listing
    Then I should not see "Book To Be Deleted"

  Scenario: Editing a book
    Given I am logged into the admin panel
    And there is a book named "Book To Be Edited" valued at "$135.99"
    When I visit the admin panel url
    And I click "Edit" for the book "Book To Be Edited"
    And I change the book name to "Book That Has Been Edited"
    And I change the book price to "222.22"
    And I click "Submit"
    Then I should see the new book's details on the admin panel
    When I visit the Bookstore public book listing
    Then I should see "Book That Has Been Edited"
    And I should see "$222.22"
