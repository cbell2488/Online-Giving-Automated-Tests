@selenium
Feature: Give One Time Gift
   Scenario: Successful creation of a one time gift
	Given I am on donor login page to give one time gift
       When I sign in as donor to give one time gift
       Then I am on the donor landing page to give one time gift
       When I choose Give a New Gift to give a one time gift
	   Then I am taken to the funds list to add a one time gift
	   When I select a fund to create a one time gift
	   Then One Time Gift details are filled out
       When I am taken to the Confirm Givings page for a one time gift
       Then The new one time gift is saved and I am taken to the confirmation page
       When I select Finish for one time gift
       Then I am taken to my home page one time gift
       When I select View or Update My Current Gifts to check my one time gift
       Then My new one time gift is present