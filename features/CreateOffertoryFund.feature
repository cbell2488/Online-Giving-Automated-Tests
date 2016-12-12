@selenium
Feature: Create Offertory Fund
   Scenario: Successful addition of a fund
	Given I am on org login page add fund
    When I sign in orgadmin add fund
    Then I am on the orgadmin landing page add fund
    When I choose Manage Funds to add fund
	Then I am taken to the funds section to add fund
	When I click to create a new fund
	Then I am taken to the new funds page
	When I enter fund details 
	Then Fund details are filled out
	When I click Save Fund  
	Then The new fund is Saved and I am taken back to the funds page