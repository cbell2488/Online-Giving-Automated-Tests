
Given(/^I am on login page org admin$/) do
   visit $appHost + '/7007'
   end

OrgLogin = GlobalVars.new

When(/^I sign in org admin$/) do
  fill_in 'UserName', with: OrgLogin.org_admin
  fill_in 'Password', with: OrgLogin.org_admin_password
  click_button 'Login'
  sleep 2
end

Then(/^I am on the org admin site$/) do
  page.should have_content('Manage My Church')
end
