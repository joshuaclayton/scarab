Feature: Run scarab from the command line

  @slow_process
  Scenario: Search for a basic word
    When I run `scarab fatedh`
    Then the output should contain "fated"
    And the output should contain "hated"
    And the output should contain "ate"
    But the output should not contain "rated"
