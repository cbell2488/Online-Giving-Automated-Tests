@selenium
Feature: Give Recurring Gift
  Scenario: Successful creation of a recurring gift
    Given I am on donor login page to give recurring gift
    When I sign in as donor to give recurring gift
    Then I am on the donor landing page to give recurring gift
    When I choose Give a New Gift to give a recurring gift
    Then I am taken to the funds list to add a recurring gift
    When I select a fund to create a recurring gift
    Then Recurring Gift details are filled out
    When I am taken to the Confirm Givings page for a recurring gift
    Then The new recurring gift is saved and I am taken to the confirmation page
    When I select Finish for recurring gift
    Then I am taken to my home page recurring gift
    When I select View or Update My Current Gifts to check my recurring gift
    Then My new recurring gift is present