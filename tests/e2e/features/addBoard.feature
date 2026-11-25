Feature: Add board
  As a user
  I want to add a board
  So that I can organize the tasks of a project on a separate board

  Scenario Outline: User adds a board
    Given the user has logged in
    When the user adds a board named "test"
    And the user selects the project "Getting started"
    And the user selects the template "<templateType>"
    Then a board with the name "test" should be created
    And the board should be in the project "Getting started"
    And the board should contain the lists "<templateLists>"
    And the user should be navigated to the "test" board

      Examples:
      |templateType         |templateLists                                                          |
      |empty                |Done                                                                   |
      |Kanban               |Open, Todo, In Progress, To Test, Done                                 |
      |Marketing Campaign   |Open, Planned, Creating, Review, Scheduled, Published, Analytics, Done |
      |Personal             |Open, Planned, Today, This Week, Done                                  |
      |Simple               |Open, Todo, In Progress, Done                                          |
      |Software Development |Open, Todo, In Progress, Code Review, Testing, Done                    |
