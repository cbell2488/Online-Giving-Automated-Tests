Given(/^I am on org login page$/) do
   visit $appHost + '/7007'
end

UpdatedFund = GlobalVars.new

When(/^I sign in orgadmin$/) do
  fill_in 'UserName', with: UpdatedFund.org_admin
  fill_in 'Password', with: UpdatedFund.org_admin_password
  click_button 'Login'
  sleep 2
end

Then(/^I am on the orgadmin landing page$/) do
  page.should have_content('Manage My Church')
end

When(/^I choose Manage Funds$/) do
	click_link 'Funds'
end

Then(/^I am taken to the funds section$/) do
	page.should have_content(UpdatedFund.new_fund)
end

When(/^I click to edit a fund/) do
	click_link UpdatedFund.new_fund
end

Then(/^I am taken to the fund details page$/) do
	page.should have_content('Update Fund')
end

When(/^I update fund details$/) do
	fill_in'FundName', with: UpdatedFund.updated_fund
	fill_in'FundNumber', with: UpdatedFund.updated_fund_number
	select('Public', from: 'Private')
	select('Active', from: 'RecordStatus')
	fill_in('StartDate', with: '11/23/2016')
	fill_in('EndDate', with: '02/01/2018', wait: 8)
	check('recurringGiftType')
	uncheck('pledgeGiftType')
	uncheck('oneTimeGiftType')
	uncheck('webSourceType')
	check('quickSourceType')
	uncheck('mobileSourceType')
end

Then(/^Fund details are updated$/) do
   page.has_content?(UpdatedFund.updated_fund)   
end

When(/^I click Save$/)do
	click_button('SaveForm')
end

Then(/^The fund is saved and I am taken back to the funds page$/)do
	expect(page).to have_content('Funds')
end

When(/^I click to edit the updated fund/) do
	click_link UpdatedFund.updated_fund
end





