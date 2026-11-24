Feature: Create an account
  As a user
  I want to create an account
  So I can use 4GA Boards to organize my projects

  Scenario Outline: Reject invalid email
    Given the user is on the registration page
    When the user enters Email "<email>"
    And the user submits the registration form
    Then the user stays on the registration page
    And the Email input field border should be red

    Examples:
    |email      |
    |           |
    |test       |
    |test@test  |
    |test.test  |
    |test@test. |
    |test@test.a|

  Scenario: Missing password
    Given the user is on the registration page
    And the user has entered a valid email "test@test.com"
    And the user has not entered a password
    When the user submits the registration form
    Then the user stays on the registration page
    And the Password input field border should be red

  Scenario Outline: Reject weak password
    Given the user is on the registration page
    And has entered a valid email "test@test.com"
    When the user enters password "<password>"
    And the user submits the registration form
    Then the user stays on the registration page
    And the password input field border should be red
    And a red box with the message Please use a stronger password is desplayed below "Create your account"

    Examples:
    |password   |
    |a          |
    |hello      |
    |hello1     |
    |hello1>    |
    |helloHello |

  Scenario: Terms and conditions not accepted
    Given the user is on the registration page
    And the user has entered a valid email "test@test.com"
    And the user has entered a strong enough password "testTest7"
    When the user has not accepted the Terms of Service and Privacy Policy
    And the user submits the registration form
    Then the user stays on the registration page
    And the Accept Terms of Service and Privacy Policy boarder has turned red
    And  red box with the message "Please accept Terms of Service and Provacy Policy" is desplayed below "Create your account"

  Scenario: User registers sucessfully
    Given the user is on the registration page
    And the user has entered a valid email "test@test.com"
    And the user has entered a strong enough password
    And the user has accepted the Terms of Service and Privacy Policy
    When the user submits the registration form
    Then the user is registered
    And the user is navigated to the dashboard
