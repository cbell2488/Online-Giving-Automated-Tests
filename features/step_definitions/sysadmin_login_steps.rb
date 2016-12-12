

Given(/^I am on sysadmin login page$/) do
   visit $appHost + '/-1'
end

SysAdmin = GlobalVars.new

When(/^I sign in as sysadmin$/) do
  fill_in 'UserName', with: SysAdmin.sys_admin
  fill_in 'Password', with: SysAdmin.sys_admin_password
  click_button 'Login'
end

Then(/^I am on the sysadmin site$/) do
	expect(page).to have_current_path(/SysAdmin/)
	sleep 5
end
