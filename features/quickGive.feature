 @selenium
 Feature: Quick Give 
   Scenario: Successful Quick Give
     Given I am on landing page
	 When I click Quick Give
	 Then I am taken to the Quick Give Form
	 
	 When I fill out personal information 
	 Then Personal Information is filled out
	 When I fill out Address information 
	 Then Address Information is filled out
         When I fill out Gift information
         Then Gift Information is filled out
         When I fill out Payment Type
         Then Payment Type is filled out
         When I fill out Payment Information
         Then Payment Information is filled out
         When I fill out Submission Information
         Then I am directed to a confirmation page
        