Feature: Mailinator

  Scenario: Cucumber integration
    Given I have mailinator email address
    And I've manually sent an email to it
    When I wait 2 seconds for mail to process
    Then the email subject should match /omgwtfbbq/
    And the email body should match /http:\/\/zombo\.com/
