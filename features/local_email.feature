Feature: LocalEmail Creating
  Scenario: Create without sender
    Given the sender "",receiver "abbc@126.com", subject "test email", body "test body"
    When sender is nil?
    Then it should return sender can not be nil


