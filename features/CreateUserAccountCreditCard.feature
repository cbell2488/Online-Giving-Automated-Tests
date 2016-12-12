@selenium
Feature: Create User Account Credit Card
   Scenario: Successful creation of a new user account credit card
	Given I am on org login page create account credit card
    When I select Create New Account credit card
    Then I am on the New User Account Profile page credit card
    When I enter new user account details credit card
	Then User account details are filled out credit card
	When I enter new user credentials credit card
	Then User credentials are filled out credit card
	When I enter a new payment method credit card
	Then Payment method details are filled out credit card
	When I opt out of initial gift credit card
	Then I am taken to the new user's home page credit card