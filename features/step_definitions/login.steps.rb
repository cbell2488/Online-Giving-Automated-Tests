

Given(/^I am on login page$/) do
   visit $appHost + '/2001'
end

DonorLogin = GlobalVars.new

When(/^I sign in donor$/) do
  fill_in 'UserName', with: DonorLogin.donor_login
  fill_in 'Password', with: DonorLogin.donor_password
  click_button 'Login'
  sleep 2
end

Then(/^I am on the donor site$/) do
  page.should have_content('Online Giving Home')
end

