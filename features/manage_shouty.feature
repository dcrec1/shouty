@javascript
Feature: Manage Shouty

  Scenario: Home page
    Given I am logged
    And I am on the home page
    When I fill in "hi, my name is what" for "shouty_body"
    And I press "shoutt!"
    Then I should see "hi, my name is what"
    And I should see "dcrec1"

    When I follow "delete"
    Then I should not see "hi, my name is what"
    And I should not see "dcrec1"
