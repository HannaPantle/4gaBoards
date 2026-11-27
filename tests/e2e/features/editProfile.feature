Feature: Edit Profile
  As a user
  I want to edit my Profile
  So that my Name, Phone Number and Organisation are up to date

  Background:
    Given The user has logged in
    And The user has navigated to the profile settings page

  Scenario: Save the profile with empty name field
    When the user tries to save the profile with an empty name
    Then the profile updates are not saved
    And the name field is highlighted

  Scenario: Editing the profile without any changes
    Given the following information was saved into the user profile:
      |Name         |Alice      |
      |Phone        |           |
      |Organisation |           |
    When the user tries to uptate their profile with:
      |Name         |Alice      |
      |Phone        |           |
      |Organisation |           |
    Then they cannot save their profile

  Scenario: Editing profile sucessful
    Given the following information was saved into the user profile
      |Name         |Alice      |
      |Phone        |           |
      |Organisation |           |
    When the user uptates their profile with:
      |Name         |Alice      |
      |Phone        |1234567    |
      |Organisation |TestCompany|
    Then their profile is saved as:
      |Name         |Alice      |
      |Phone        |1234567    |
      |Organisation |TestCompany|
    And they cannot save their profile again
