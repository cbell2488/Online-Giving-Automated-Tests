@selenium
Feature: Create User Account With Gift
   Scenario: Successful creation of a new user account with gift
	Given I am on org login page create account with gift
    When I select Create New Account with gift
    Then I am on the New User Account Profile page with gift
    When I enter new user account details with gift
	Then User account details are filled out with gift
	When I enter new user credentials with gift
	Then User credentials are filled out with gift
	When I enter a new payment method with gift
	Then Payment method details are filled out with gift
	When I select a fund to create a one time gift new account
	Then One Time Gift details are filled out new account
	
	