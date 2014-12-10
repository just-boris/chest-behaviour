Feature: Chest close drawer
  Should properly handle states

  Scenario: Close any drawer
    Given chest, drawers 1, 2 open
    When  close drawer 1
    Then  there is opened drawer 2

  Scenario: Close drawer and able open it again
    Given chest, drawers 1, 2 open
    When  close drawer 1
    And   open drawer 1
    Then  there is opened drawers 1, 2

  Scenario: Close both drawers and cannot open it all again
    Given chest, drawers 1, 2 open
    When  close drawer 1
    And   close drawer 2
    And   open drawer 1
    And   open drawer 2
    Then  there is opened drawer 1
