Feature: Login
  As a user
  I want to login
  So I can see my dashboard

  Scenario Outline: User logs in with valid credentials
    Given the user has navigated to the login page
    When the user logs in with username "<username>" and password "<pwd>"
    Then the user should be navigated to the dashboard
    And ther user should have <priv> priviledges

    Examples:
    |user|pwd|priv|
    |demo|demo|admin|
    |Alice|alice|user|
