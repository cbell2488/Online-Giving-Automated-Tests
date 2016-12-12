Given (/^I am on landing page to give$/) do
  visit $appHost + '/2001'
end
	 
When(/^I click Quick Give to give$/) do
  click_link 'Quick Give'
end

Then(/^I am taken to the Quick Give Form to give$/) do
  page.should have_content('Enter Information')   
end

When(/^I fill out personal information to give$/) do
   fill_in('FirstName', with: 'Automated')
   fill_in('LastName', with: 'Script')
   fill_in('Email', with: 'auto@example.com')
   fill_in('EmailConfirm', with: 'auto@example.com')
   fill_in('Phone', with: '5555555555')
   fill_in('Envelope', with: 'Env5')
end

Then(/^Personal Information is filled out to give$/) do
   page.has_content?('Automated') 
end

When(/^I fill out Address information to give$/) do
   fill_in('Address1', with: '200 Noll')
   fill_in('Address2', with: 'Apt. 6')
   fill_in('City', with: 'Huntington')
   select('IN', from: 'State')
   fill_in('Zip5', with: '46750')
   fill_in('Zip4', with: '5555')
end

Then(/^Address Information is filled out to give$/) do
   page.has_content?('200 Noll')
end

When(/^I fill out Gift information to give$/) do
   select('Ashley\'s Test Fund', from: 'FundID')
   fill_in('Amount', with: '1000')
   fill_in('SpecialIntentions', with: 'This is a special intention')
end

Then(/^Gift Information is filled out to give$/) do
   page.has_content?('Ashley\s Test Fund')
   page.has_content?('1000')
   page.has_content?('This is a special intention') 
end

When(/^I fill out Payment Type to give$/) do
   select('Bank', from: 'MethodType')
end

Then(/^Payment Type is filled out to give$/) do
   page.has_content?('Bank')  
end

When(/^I fill out Payment Information to give$/) do
   select('Checking', from: 'BankAccountType')
   fill_in('BankRoutingNumber', with: '056008849')
   fill_in('BankRoutingNumberConfirm', with: '056008849')
   fill_in('BankAccountNumber', with: '12345678901234')
   fill_in('BankAccountNumberConfirm', with: '12345678901234')
end

Then(/^Payment Information is filled out to give$/) do
   page.has_content?('Checking') 
end

When(/^I fill out Submission Information to give$/) do
   find(:xpath, '//*[@id="captcha"]/div/div/div/iframe').click
   sleep 4
   click_button('Submit')
   sleep 60
end

Then(/^I am directed to a confirmation page to give$/) do
   expect(page).to have_content('Giving Receipt')
   page.has_content?('Ashley\s Test Fund')
   page.has_content?('You made a One Time payment of $1,000.00 to Ashley\'s Test Fund. 
   Your Bank Account account will be charged on 11/16/16.')
   page.has_content?('This is a special intention')
   page.has_content?('Your confirmation number is:')
end





