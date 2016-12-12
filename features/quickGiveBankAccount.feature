 @selenium
 Feature: Quick Give Bank Account
   Scenario: Successful Quick Give with Bank Account
     Given I am on landing page to give
	 When I click Quick Give to give
	 Then I am taken to the Quick Give Form to give
	 
	 When I fill out personal information to give 
	 Then Personal Information is filled out to give
	 When I fill out Address information to give
	 Then Address Information is filled out to give
         When I fill out Gift information to give
         Then Gift Information is filled out to give
         When I fill out Payment Type to give
         Then Payment Type is filled out to give
         When I fill out Payment Information to give
         Then Payment Information is filled out to give
         When I fill out Submission Information to give
         Then I am directed to a confirmation page to give