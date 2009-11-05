Feature: List Shouties

  Scenario: Home page
    Given I exist
    Given the following shouties exist
      | body | user_id |
      |  hi  |    1    |
      |  my  |    1    |
      | name |    1    |
      |  is  |    1    |
    When I log in
    Then I should see shouties table
      |  is  |
      | name |
      |  my  |
      |  hi  |