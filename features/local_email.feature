Feature: LocalEmail Creating
  create new orders
  Scenario: customer reads terms
    Given I am on customer terms page
    When I press "Create new order" button
    Then I should be on new order page
