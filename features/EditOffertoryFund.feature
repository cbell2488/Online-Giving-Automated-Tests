@selenium
Feature: Edit Offertory Fund  	
  Scenario: Successful edit of a fund
	Given I am on org login page
    When I sign in orgadmin
    Then I am on the orgadmin landing page
    When I choose Manage Funds
	Then I am taken to the funds section
	When I click to edit a fund
	Then I am taken to the fund details page
	When I update fund details
    Then Fund details are updated
    When I click Save
    Then The fund is saved and I am taken back to the funds page
    When I click to edit the updated fund
 

    
	
	
	
	
  