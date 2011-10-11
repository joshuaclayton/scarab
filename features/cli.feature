Feature: Run scarab from the command line

  @slow_process
  Scenario: Search for a basic word
    When I run `scarab match fatedh`
    Then the output should contain "fated"
    And the output should contain "hated"
    And the output should contain "ate"
    But the output should not contain "rated"

  @slow_process
  Scenario: Search for a basic word matching a regexp
    When I run `scarab match fatedh --matching 'ed$'`
    Then the output should contain "fated"
    And the output should contain "hated"
    But the output should not contain "rated"
    And the output should not contain "fate "
