Given(/^I am on org login page create account$/) do
    visit $appHost + '/2001'
end

User = GlobalVars.new

When(/^I select Create New Account$/) do
  click_button 'Create New Account'
  sleep 2
end

Then(/^I am on the New User Account Profile page$/) do
  page.should have_content('New User Account Registration')
end

When(/^I enter new user account details$/) do
	fill_in('firstName', with: User.user_first_name)
	fill_in('lastName', with: User.user_last_name)
	fill_in('email', with: User.user_email)
	fill_in('confirmEmail', with: User.user_email)
	fill_in('addressline1', with: '250 South Plaza')
	fill_in('city', with: 'Fort Wayne')
	select('IN', from: 'state')
    fill_in('zip', with: '46825')
    find(:xpath, '/html/body/div[1]/div[2]/div/div/div[2]/div/div/div[2]/div/form/fieldset/div/div[9]/div/input').send_keys "2607778888"
end

Then(/^User account details are filled out$/) do
   page.has_content?(User.user_first_name)
   page.has_content?(User.user_last_name)
   find(:xpath, '/html/body/div[1]/div[2]/div/div/div[2]/div/div/div[2]/div/div/button').click
   sleep 5 
end

When(/^I enter new user credentials$/) do
    expect(page).to have_content('User ID') 
	fill_in('username', with: User.user_login)
	fill_in('password', with: User.user_password)
	fill_in('confirmPassword', with: User.user_password)
    within_frame(find(:css, 'body > div.container.center > div.row > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div > form > fieldset > div > div:nth-child(4) > div > div > div > div > div > iframe')) do
		find(:css,'#recaptcha-anchor > div.recaptcha-checkbox-checkmark').click
	end
    sleep 2
end

Then(/^User credentials are filled out$/) do
   page.has_content?(User.user_login)
   find(:css, 'body > div.container.center > div.row > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div > button.btn.btn-success').click
   sleep 60 
end

When(/^I enter a new payment method$/) do
    expect(page).to have_content('You\'ve successfully created an Online Giving Account. Add a payment method to your account so you can start giving.') 
	fill_in('bank_name', with: 'Chase Bank')
	select('Savings', from: 'bank_accnt_type')
	fill_in('routing_number', with: '074000010')
	fill_in('confirm_routing_number', with: '074000010')
	fill_in('account_number', with: '87654321')
	fill_in('confirm_account_number', with: '87654321')    
end


Then(/^Payment method details are filled out$/) do
   page.has_content?('Chase Bank')
   find(:css,'#paymentMethodForm > div.row > div:nth-child(1) > button').click
   sleep 5 
end

When(/^I opt out of initial gift$/) do
    expect(page).to have_content('Your payment method was saved. Let\'s create your first gift.')
    find(:css,'#giveGift > div > form > div.row.top-buffer > button.span.olg.btn-link').click
    sleep 5
end

Then(/^I am taken to the new user's home page$/) do
   page.has_content?('New\s Online Giving Home')
end









