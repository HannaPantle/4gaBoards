Feature: Create an account
  As a user
  I want to create an account
  So I can use 4GA Boards to organize my projects

  Background:
    Given the user is on the registration page

  Scenario Outline: Reject invalid email
    When the user tries to create an account with email "<email>" and password "testTest1"
    Then no account should be created
    And the Email input field should be highlighted

    Examples:
    | email      |
    |            |
    | test       |
    | test.test  |
    | test@      |

  Scenario: Reject empty password
    When the user tries to create an account with email "test@test.com" and password ""
    Then no account should be created
    And the Password input field should be highlighted

  Scenario Outline: Reject weak password
    When the user tries to create an account with email "test@test.com" and password "<password>"
    Then no account should be created
    And the Password input field should be highlighted
    And the message 'Please use a stronger password' should be displayed

    Examples:
    | password   |
    | hello      |
    | hello1>    |
    | helloHello |

  Scenario: Reject not accepted terms and conditions
    When the user tries to create an account with email "test@test.com" and password "testTest1"
    And the user has not accepted the 'Terms of Service and Privacy Policy'
    Then no account should be created
    And the Accept Terms of Service and Privacy Policy checkbox should be highlighted
    And the message 'Please accept Terms of Service and Provacy Policy' should be displayed

  Scenario: User registers sucessfully
    When the user tries to create an account with email "test@test.com" and password "testTest1"
    And the user has accepted the 'Terms of Service and Privacy Policy'
    Then the dashboard should be displayed
    And an account should be created
