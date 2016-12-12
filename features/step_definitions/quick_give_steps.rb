Given (/^I am on landing page$/) do
   visit $appHost + '/2001'
end
	 
When(/^I click Quick Give$/) do
  click_link 'Quick Give'
end

Then(/^I am taken to the Quick Give Form$/) do
  page.should have_content('Enter Information')   
end

When(/^I fill out personal information$/) do
   fill_in('FirstName', with: 'Automated')
   fill_in('LastName', with: 'Script')
   fill_in('Email', with: 'auto@example.com')
   fill_in('EmailConfirm', with: 'auto@example.com')
   fill_in('Phone', with: '5555555555')
   fill_in('Envelope', with: 'Env5')
end

Then(/^Personal Information is filled out$/) do
   page.has_content?('Automated')
end

When(/^I fill out Address information$/) do
   fill_in('Address1', with: '200 Noll')
   fill_in('Address2', with: 'Apt. 6')
   fill_in('City', with: 'Huntington')
   select('IN', from: 'State')
   fill_in('Zip5', with: '46750')
   fill_in('Zip4', with: '5555')
end

Then(/^Address Information is filled out$/) do
   page.has_content?('200 Noll')
     
end

When(/^I fill out Gift information$/) do
   select('Ashley\'s Test Fund', from: 'FundID')
   fill_in('Amount', with: '1000')
   fill_in('SpecialIntentions', with: 'This is a special intention')
end

Then(/^Gift Information is filled out$/) do
   page.has_content?('Ashley\s Test Fund')
   page.has_content?('1000')
   page.has_content?('This is a special intention')  
end

When(/^I fill out Payment Type$/) do
   select('Card', from: 'MethodType')
   check('AdditionalGiving')
end

Then(/^Payment Type is filled out$/) do
   page.has_content?('Card')
   page.has_checked_field?('AdditionalGiving').should be true   
    
end

When(/^I fill out Payment Information$/) do
   fill_in('CardNumber', with: '4111111111111111')
   select('December', from: 'ExpirationMonth')
   select('2016', from: 'ExpirationYear')
end

Then(/^Payment Information is filled out$/) do
   page.has_content?('4111111111111111')  
end

When(/^I fill out Submission Information$/) do
   find(:xpath, '//*[@id="captcha"]/div/div/div/iframe').click
   sleep 4
   click_button('Submit')
   sleep 60
end

Then(/^I am directed to a confirmation page$/) do
   expect(page).to have_content('Giving Receipt')
   page.has_content?('Ashley\s Test Fund')
   page.has_content?('You made a One Time payment of $1,003.00 (including an additional 
   gift of $3.00 to offset fees) to Ashley\'s Test Fund. Your Credit Card account 
   will be charged on 11/16/16.')
   page.has_content?('This is a special intention')
   page.has_content?('Your confirmation number is:')
end

