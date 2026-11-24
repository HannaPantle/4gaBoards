Feature: Create an account
  As a user
  I want to create an account
  So I can use 4GA Boards to organize my projects

  Background:
    Given the user is on the registration page

  Scenario Outline: Reject invalid email
    When the user tries to create an account with email "<email>"
    Then the account creation should be unsuccessful
    And the Email input field should be highlighted

    Examples:
    |email      |
    |test       |
    |test@test  |
    |test.test  |

  Scenario: Missing password
    When the user tries to create an account with email "test@test.com" and has not entered a password
    Then the account creation should be unsuccessful
    And the Password input field should be highlighted

  Scenario Outline: Reject weak password
    When the user tries to create an account with email "test@test.com" and password "<password>"
    Then the account creation should be unsuccessful
    And the Password input field should be highlighted
    And the message 'Please use a stronger password' should be displayed

    Examples:
    |password   |
    |hello      |
    |hello1>    |
    |helloHello |

  Scenario: Terms and conditions not accepted
    When the user tries to create an account with email "test@test.com", password "<password>"
    And the user has not accepted the 'Terms of Service' and 'Privacy Policy'
    Then Then the account creation should be unsuccessful
    And the Accept Terms of Service and Privacy Policy checkbox has been highlighted
    And the message 'Please accept Terms of Service and Provacy Policy' is displayed

  Scenario: User registers sucessfully
    When the user tries to create an account with email "test@test.com", password "<password>"
    And the user has accepted the 'Terms of Service' and 'Privacy Policy'
    Then the dashboard is displayed
    And the user is registered
