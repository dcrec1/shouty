Feature: Create Shouty

  Scenario: Home page
    Given I am logged
    And I am on the home page
    When I fill in "hi, my name is what" for "shouty_body"
    And I press "Create Shouty"
    And I wait for the AJAX call to finish
    Then I should see "hi, my name is what"
    And I should see "dcrec1"