Given(/^I am on donor login page to give recurring gift$/) do
  visit $appHost + '/2001'
end

RecurringDonorLogin = GlobalVars.new

When(/^I sign in as donor to give recurring gift$/) do
  fill_in 'UserName', with: RecurringDonorLogin.donor_login
  fill_in 'Password', with: RecurringDonorLogin.donor_password
  click_button 'Login'
  sleep 2
end

Then(/^I am on the donor landing page to give recurring gift$/) do
  page.should have_content('Test\'s Online Giving Home')
end

When(/^I choose Give a New Gift to give recurring gift$/) do
  find('body > div.container.center > div.row > div.span8 > h5:nth-child(2) > a').click
end

Then(/^I am taken to the funds list to add a recurring gift$/) do
  page.should have_content('Give')
end

When(/^I select a fund to create a recurring gift$/) do
  find(:xpath, '//*[@id="giftsForm"]/div[4]/h5/select/option[2]').click
  sleep 2
  fill_in('InstallmentAmount', with: '2000')
  select('Monthly', from: 'Frequency')
  fill_in('StartDate', with: '11/30/2017')
  select('Court\'s Card - 1111', from: 'PaymentMethod')
end

Then(/^Recurring Gift details are filled out$/) do
  page.has_content?('2000')
  find('#giftsForm > div.text-right.clear-fix > button:nth-child(2)').click
end

When(/^I am taken to the Confirm Givings page for a recurring gift$/)do
  sleep 40
  page.has_content?('I would like to give $2,000.00 Monthly. Please charge my Court\'s Card - 1111 starting on 11/30/2017.')
  find('#giftsForm > div.text-right.clear-fix > button:nth-child(4)').click
  sleep 4
end

Then(/^The new recurring gift is saved and I am taken to the confirmation page$/)do
  sleep 40
  page.should have_content('You are Offering $2,000.00 Monthly to Ashley\'s Test Fund. Your Court\'s Card - 1111 account will be charged starting on 11/30/17.')
  page.has_content?('This is a test')
end

When(/^I select Finish for recurring gift$/)do
  find('body > div.container.center > div:nth-child(3) > div > div:nth-child(5) > div.confirm.text-right.clear-fix.hidden-print > a.confirmbtn.btn.btn-success').click
  sleep 8
end

Then(/^I am taken to my home page recurring gift$/)do
  page.has_content?('Test\'s Online Giving Home')
end

When(/^I select View or Update My Current Gifts to check my recurring gift$/)do
  find('body > div.container.center > div.row > div.span8 > h5:nth-child(3) > a').click
end

Then(/^My new recurring gift is present$/)do
  page.has_content?('Ashley\'s Test Fund')
end



