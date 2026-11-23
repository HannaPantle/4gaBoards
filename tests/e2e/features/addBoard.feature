Feature: Add board
  As a user
  I want to add a board
  So I can work on my project

  Scenario Outline: User adds a board
    Given the user has navigated to the dashboard
    And a project named "Getting started" has been created
    When the user adds a board named "test"
    And selects the project "Getting started"
    And selects the template "Empty"
    Then a board with the name "test" should have been created
    And the board should be in the project "Getting started"
    And the board should use the template "Empty"
    And the user should have been navigated to the "test" board
