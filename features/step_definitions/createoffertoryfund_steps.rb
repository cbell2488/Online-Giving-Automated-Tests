Given(/^I am on org login page add fund$/) do
   visit $appHost + '/7007'
end

NewFund = GlobalVars.new

When(/^I sign in orgadmin add fund$/) do
  fill_in 'UserName', with: NewFund.org_admin
  fill_in 'Password', with: NewFund.org_admin_password
  click_button 'Login'
  sleep 2
end

Then(/^I am on the orgadmin landing page add fund$/) do
  page.should have_content('Manage My Church')
end

When(/^I choose Manage Funds to add fund$/) do
	click_link 'Funds'
end

Then(/^I am taken to the funds section to add fund$/) do
	page.should have_content('Funds')
end

When(/^I click to create a new fund$/) do
	find(:css, 'body > div.container.center > div:nth-child(5) > div > a').click
end

Then(/^I am taken to the new funds page$/) do
	page.should have_content('Add Fund')
end

When(/^I enter fund details$/) do
    field_labeled("Goal", disabled: true)
	fill_in 'FundName', with: NewFund.new_fund
	fill_in'FundNumber', with: NewFund.new_fund_number
	select('Public', from: 'Private')
	select('Active', from: 'RecordStatus')
	fill_in('StartDate', with: '11/23/2016')
	fill_in('EndDate', with: '02/01/2018')
	check('recurringGiftType')
	check('pledgeGiftType')
	check('oneTimeGiftType')
	uncheck('webSourceType')
	check('quickSourceType')
	uncheck('mobileSourceType')
	fill_in('Goal', with:'100000')
	within_frame(find(:css, '#FundDetailForm > div:nth-child(3) > div:nth-child(1) > div:nth-child(6) > div > table > tbody > tr:nth-child(2) > td > iframe')) do
		page.execute_script("document.querySelector('body').innerHTML = 'This is a test fund'")
	end
	page.has_content?('You must save the fund first to see the direct donate link.')
end

Then(/^Fund details are filled out$/) do
   page.has_content?(NewFund.new_fund) 
end

When(/^I click Save Fund$/)do
	click_button('SaveForm')
end

Then(/^The new fund is Saved and I am taken back to the funds page$/)do
	page.should have_content(NewFund.new_fund)
end


