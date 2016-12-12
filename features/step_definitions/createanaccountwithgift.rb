Given(/^I am on org login page create account with gift$/) do
   visit $appHost + '/2001'
end

UserOneTimeGift = GlobalVars.new

When(/^I select Create New Account with gift$/) do
  click_button 'Create New Account'
  sleep 2
end

Then(/^I am on the New User Account Profile page with gift$/) do
  page.should have_content('New User Account Registration')
end

When(/^I enter new user account details with gift$/) do
	fill_in('firstName', with: UserOneTimeGift.user_first_name_one_time_gift)
	fill_in('lastName', with: UserOneTimeGift.user_last_name_one_time_gift)
	fill_in('email', with: UserOneTimeGift.user_email_one_time_gift)
	fill_in('confirmEmail', with: UserOneTimeGift.user_email_one_time_gift)
	fill_in('addressline1', with: '250 South Plaza')
	fill_in('city', with: 'Fort Wayne')
	select('IN', from: 'state')
    fill_in('zip', with: '46825')
    find(:xpath, '/html/body/div[1]/div[2]/div/div/div[2]/div/div/div[2]/div/form/fieldset/div/div[9]/div/input').send_keys "2607778888"
end

Then(/^User account details are filled out with gift$/) do
   page.has_content?(UserOneTimeGift.user_first_name_one_time_gift)
   page.has_content?(UserOneTimeGift.user_last_name_one_time_gift)
   find(:xpath, '/html/body/div[1]/div[2]/div/div/div[2]/div/div/div[2]/div/div/button').click
   sleep 5 
end

When(/^I enter new user credentials with gift$/) do
    expect(page).to have_content('User ID') 
	fill_in('username', with: UserOneTimeGift.user_login_one_time_gift)
	fill_in('password', with: UserOneTimeGift.user_password_one_time_gift)
	fill_in('confirmPassword', with: UserOneTimeGift.user_password_one_time_gift)
    within_frame(find(:css, 'body > div.container.center > div.row > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div > form > fieldset > div > div:nth-child(4) > div > div > div > div > div > iframe')) do
		find(:css,'#recaptcha-anchor > div.recaptcha-checkbox-checkmark').click
	end
    sleep 2
end

Then(/^User credentials are filled out with gift$/) do
   page.has_content?(UserOneTimeGift.user_login_one_time_gift)
   find(:css, 'body > div.container.center > div.row > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div > div > button.btn.btn-success').click
   sleep 60 
end

When(/^I enter a new payment method with gift$/) do
    expect(page).to have_content('You\'ve successfully created an Online Giving Account. Add a payment method to your account so you can start giving.') 
	fill_in('bank_name', with: 'Chase Bank')
	select('Savings', with: 'bank_accnt_type')
	fill_in('routing_number', with: '074000010')
	fill_in('confirm_routing_number', with: '074000010')
	fill_in('account_number', with: '87654321')
	fill_in('confirm_account_number', with: '87654321')    
end


Then(/^Payment method details are filled out with gift$/) do
   page.has_content?('Chase Bank')
   find(:css,'#paymentMethodForm > div.row > div:nth-child(1) > button').click
   sleep 5 
end

When(/^I select a fund to create a one time gift new account$/) do
	find(:xpath, '//*[@id="giveGift"]/div/form/div[1]/div[1]/div/a').click
	sleep 2
	within(find('div[class="span olg-dropdown-control"]'))do
		find('#giveGift > div > form > div:nth-child(2) > div.row.instanthide > div > div > div:nth-child(1) > div').click
	end
	sleep 2
	find('#giveGift > div > form > div:nth-child(4) > div:nth-child(1) > select').first(:option, 'One Time').select_option
	sleep 2
	fill_in('Amount', with: '2000')
	fill_in('StartDate', with: '11/30/2017')
    page.has_content?('I would like to make a One Time Gift of $2,000.00 to Testing .')
    page.has_content?('Please charge my Saving payment method one time on 11/30/2017 .')
    find('#giveGift > div > form > div.row.top-buffer > button.span.btn.btn-success').click
end

Then(/^One Time Gift details are filled out new account$/) do
   page.has_content?('Thank you for creating a new Online Giving Account.')
   page.has_content?('Your gift has been submitted')
   find('body > div.container.center > div.row > div > div > div:nth-child(2) > div > div > div:nth-child(3) > div > button.btn.btn-primary').click   
end




