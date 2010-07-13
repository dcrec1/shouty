Feature: List Shouties

  Scenario: Home page
    Given a shouty exists with body: "hi"
    And another shouty exists with body: "my"
    And another shouty exists with body: "name"
    And another shouty exists with body: "is"
    And I exist
    When I log in
    And I go to the home page
    Then I should see shouties table
      |  is  |
      | name |
      |  my  |
      |  hi  |
  And I should not see "delete"
