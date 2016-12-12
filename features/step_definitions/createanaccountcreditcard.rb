Given(/^I am on org login page create account credit card$/) do
   visit $appHost + '/2001'
end

UserCreditCard = GlobalVars.new

When(/^I select Create New Account credit card$/) do
  click_button 'Create New Account'
  sleep 2
end

Then(/^I am on the New User Account Profile page credit card$/) do
  page.should have_content('New User Account Registration')
end

When(/^I enter new user account details credit card$/) do
	fill_in('firstName', with: UserCreditCard.user_first_name_credit_card)
	fill_in('lastName', with: UserCreditCard.user_last_name_credit_card)
	fill_in('email', with: UserCreditCard.user_email_credit_card)
	fill_in('confirmEmail', with: UserCreditCard.user_email_credit_card)
	fill_in('addressline1', with: '250 South Plaza')
	fill_in('city', with: 'Fort Wayne')
	select('IN', from: 'state')
    fill_in('zip', with: '46825')
    find(:xpath, '/html/body/div[1]/div[2]/div/div/div[2]/div/div/div[2]/div/form/fieldset/div/div[9]/div/input').send_keys "2607778888"
end

Then(/^User account details are filled out credit card$/) do
   page.has_content?(UserCreditCard.user_first_name_credit_card)
   page.has_content?(UserCreditCard.user_last_name_credit_card)
   find(:xpath, '/html/body/div[1]/div[2]/div/div/div[2]/div/div/div[2]/div/div/button').click
   sleep 5 
end

When(/^I enter new user credentials credit card$/) do
    expect(page).to have_content('User ID') 
	fill_in('username', with: UserCreditCard.user_login_credit_card)
	fill_in('password', with: UserCreditCard.user_password_credit_card)
	fill_in('confirmPassword', with: UserCreditCard.user_password_credit_card)
    within_frame(find(:css, 'body > div.container.center > div.row > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div > form > fieldset > div > div:nth-child(4) > div > div > div > div > div > iframe')) do
		find(:css,'#recaptcha-anchor > div.recaptcha-checkbox-checkmark').click
	end
    sleep 2
end

Then(/^User credentials are filled out credit card$/) do
   page.has_content?(UserCreditCard.user_login_credit_card)
   find(:css, 'body > div.container.center > div.row > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div > button.btn.btn-success').click
   sleep 40 
end

When(/^I enter a new payment method credit card$/) do
    expect(page).to have_content('You\'ve successfully created an Online Giving Account. Add a payment method to your account so you can start giving.')
    find(:css, '#paymentTypeToggle > div > button:nth-child(2)').click
    find(:xpath, '//*[@id="paymentMethodForm"]/div[2]/div[2]/input').send_keys '4111111111111111' 
	fill_in('cc_cardname', with: 'Test Card')
    select('03', from: 'cc_exp_month')	
    sleep 4
	find(:xpath, '//*[@id="cc_exp_year"]').first(:option, '2018').select_option	   
end


Then(/^Payment method details are filled out credit card$/) do
   page.has_content?('Test Card')
   find(:css, '#paymentMethodForm > div.row > div:nth-child(1) > button').click 
   sleep 5 
end

When(/^I opt out of initial gift credit card$/) do
    expect(page).to have_content('Your payment method was saved. Let\'s create your first gift.')
    find(:css,'#giveGift > div > form > div.row.top-buffer > button.span.olg.btn-link').click
    sleep 5
end

Then(/^I am taken to the new user's home page credit card$/) do
   page.has_content?('New\s Online Giving Home')
end
