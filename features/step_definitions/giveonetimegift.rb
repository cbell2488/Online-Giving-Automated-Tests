Given(/^I am on donor login page to give one time gift$/) do
   visit $appHost + '/2001'
end

GiftDonorLogin = GlobalVars.new

When(/^I sign in as donor to give one time gift$/) do
  fill_in 'UserName', with: GiftDonorLogin.donor_login
  fill_in 'Password', with: GiftDonorLogin.donor_password
  click_button 'Login'
  sleep 2
end

Then(/^I am on the donor landing page to give one time gift$/) do
  page.should have_content('Test\'s Online Giving Home')
end

When(/^I choose Give a New Gift to give a one time gift$/) do
	find('body > div.container.center > div.row > div.span8 > h5:nth-child(2) > a').click
end

Then(/^I am taken to the funds list to add a one time gift$/) do
	page.should have_content('Give')
end

When(/^I select a fund to create a one time gift$/) do
	find(:xpath, '//*[@id="giftsForm"]/div[4]/h5/select/option[3]').click
	sleep 2
	fill_in('OneTimeInstallmentAmount', with: '2000')
	fill_in('OneTimeStartDate', with: '11/30/2017')
	select('Court\'s Card - 1111', from: 'OneTimePaymentMethod')
	fill_in('SpecialInstructions', with: 'This is intended for a Christmas offering.')
end

Then(/^One Time Gift details are filled out$/) do
   page.has_content?('2000')
   find('#giftsForm > div.text-right.clear-fix > button:nth-child(2)').click   
end

When(/^I am taken to the Confirm Givings page for a one time gift$/)do
	page.has_content?('I would like to make a One Time payment of $2,000.00. Please charge my Court\'s Card - 1111 on 11/30/2017.')
	page.has_content?('This is a test')
	find('#giftsForm > div.text-right.clear-fix > button:nth-child(4)').click
	sleep 4
end

Then(/^The new one time gift is saved and I am taken to the confirmation page$/)do
	page.should have_content('You gave a One Time payment of $2,000.00 to Ashley\'s Test Fund. Your Court\'s Card - 1111 account will be charged on 11/30/17.')
	page.has_content?('This is a test')
end

When(/^I select Finish for one time gift$/)do
	find('body > div.container.center > div:nth-child(3) > div > div:nth-child(5) > div.confirm.text-right.clear-fix.hidden-print > a.confirmbtn.btn.btn-success').click 
	sleep 8
end

Then(/^I am taken to my home page one time gift$/)do
	page.has_content?('Test\'s Online Giving Home')
end

When(/^I select View or Update My Current Gifts to check my one time gift$/)do
	find('body > div.container.center > div.row > div.span8 > h5:nth-child(3) > a').click
end

Then(/^My new one time gift is present$/)do
	page.has_content?('Ashley\'s Test Fund')
end



