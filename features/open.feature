Feature: Chest open
  Should properly handle states

  Scenario: Open the drawer
    Given closed chest
    When  open drawer 2
    Then  there is opened drawer 2

  Scenario: Cannot open many drawers sequently
    Given closed chest
    When open drawer 2
    And  open drawer 3
    Then there is opened drawer 2

  Scenario: Can open many drawers in simultaneously
    Given closed chest
    When open drawer 2, 3
    Then there is opened drawers 2, 3

  Scenario: Cannot open last drawer in addition to currently opened
    Given chest, drawers 1, 2 open
    When open drawer 3
    Then there is opened drawers 1, 2

