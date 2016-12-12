@selenium
Feature: Create User Account
   Scenario: Successful creation of a new user account
	Given I am on org login page create account
    When I select Create New Account
    Then I am on the New User Account Profile page
    When I enter new user account details
	Then User account details are filled out
	When I enter new user credentials
	Then User credentials are filled out
	When I enter a new payment method 
	Then Payment method details are filled out
	When I opt out of initial gift
	Then I am taken to the new user's home page
	
	
	