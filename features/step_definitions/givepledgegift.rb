Given(/^I am on donor login page to give pledge gift$/) do
  visit $appHost + '/2001'
end

PledgeDonorLogin = GlobalVars.new

When(/^I sign in as donor to give pledge gift$/) do
  fill_in 'UserName', with: PledgeDonorLogin.donor_login
  fill_in 'Password', with: PledgeDonorLogin.donor_password
  click_button 'Login'
  sleep 2
end

Then(/^I am on the donor landing page to give pledge gift$/) do
  page.should have_content('Test\'s Online Giving Home')
end

When(/^I choose Give a New Gift to give pledge gift$/) do
  find('body > div.container.center > div.row > div.span8 > h5:nth-child(2) > a').click
end

Then(/^I am taken to the funds list to add a pledge gift$/) do
  page.should have_content('Give')
end

When(/^I select a fund to create a pledge gift$/) do
  find(:xpath, '//*[@id="giftsForm"]/div[9]/h5/select/option[3]').click
  sleep 2
  fill_in('Total', with: '2000')
  fill_in('InstallmentAmount', with: '20')
  fill_in('NextContributionDate', with: '11/30/2017')
  select('Monthly', from: 'Frequency')
  select('Court\'s Card - 1111', from: 'PaymentMethod')
end

Then(/^Pledge Gift details are filled out$/) do
  page.has_content?('2000')
  find('#giftsForm > div.text-right.clear-fix > button:nth-child(2)').click
end

When(/^I am taken to the Confirm Givings page for a pledge gift$/)do
  sleep 40
  page.has_content?('I am pledging $2,000.00. It will begin on 11/30/2017 in the amount of $20.00 Monthly from my Court\'s Card - 1111 until fulfilled on 2/28/2026.')
  find('#giftsForm > div.text-right.clear-fix > button:nth-child(4)').click
  sleep 4
end

Then(/^The new pledge gift is saved and I am taken to the confirmation page$/)do
  sleep 40
  page.should have_content('You pledged to give a total of $2,000.00 to Test. Your Court\'s Card - 1111 account will be charged $20.00 Monthly starting on 11/30/17')
end

When(/^I select Finish for pledge gift$/)do
  find('body > div.container.center > div:nth-child(3) > div > div:nth-child(5) > div.confirm.text-right.clear-fix.hidden-print > a.confirmbtn.btn.btn-success').click
  sleep 8
end

Then(/^I am taken to my home page pledge gift$/)do
  page.has_content?('Test\'s Online Giving Home')
end

When(/^I select View or Update My Current Gifts to check my pledge gift$/)do
  find('body > div.container.center > div.row > div.span8 > h5:nth-child(3) > a').click
end

Then(/^My new pledge gift is present$/)do
  page.has_content?('Ashley\'s Test Fund')
end