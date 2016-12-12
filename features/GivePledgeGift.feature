@selenium
Feature: Give Pledge Gift
  Scenario: Successful creation of a pledge gift
    Given I am on donor login page to give pledge gift
    When I sign in as donor to give pledge gift
    Then I am on the donor landing page to give pledge gift
    When I choose Give a New Gift to give pledge gift
    Then I am taken to the funds list to add a pledge gift
    When I select a fund to create a pledge gift
    Then Pledge Gift details are filled out
    When I am taken to the Confirm Givings page for a pledge gift
    Then The new pledge gift is saved and I am taken to the confirmation page
    When I select Finish for pledge gift
    Then I am taken to my home page pledge gift
    When I select View or Update My Current Gifts to check my pledge gift
    Then My new pledge gift is present