Feature: Chest when all drawers open
  Should properly handle states

  Scenario: Open all drawers
    Given closed chest
    When  open drawers 1, 2, 3
    Then  there is opened drawers 1, 2, 3

  Scenario: Close one and open it back
    Given chest, drawers 1, 2, 3 open
    When close drawer 2
    And  open drawer 2
    Then there is opened drawer 1, 2, 3

  Scenario: Close two of this and cannot open them all back
    Given chest, drawers 1, 2, 3 open
    When close drawers 2, 3
    And  open drawer 2
    And  open drawer 3
    Then there is opened drawers 1, 2

  Scenario: Close two of drawers and open it together
    Given chest, drawers 1, 2, 3 open
    When close drawers 2, 3
    And  open drawers 2, 3
    Then there is opened drawers 1, 2, 3
