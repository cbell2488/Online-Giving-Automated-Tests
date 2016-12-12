#!/usr/bin/env bash
+#!/bin/sh

OLGURL="https://qa.osvonlinegiving.com"

bundle install
rake db:migrate
rake db:test:prepare
echo off
echo Starting Automated Online Giving tests

echo
echo Running Chrome

bundle exec cucumber /Volumes/Shared/Corporate/IT/QA/Projects/Automated_Testing/Online_Giving/OLG_Capybara_Selenium_Tests/features/sysadmin_login.feature browser=chrome url=$OLGURL
bundle exec cucumber /Volumes/Shared/Corporate/IT/QA/Projects/Automated_Testing/Online_Giving/OLG_Capybara_Selenium_Tests/features/org_login.feature browser=chrome url=$OLGURL
bundle exec cucumber /Volumes/Shared/Corporate/IT/QA/Projects/Automated_Testing/Online_Giving/OLG_Capybara_Selenium_Tests/features/login_donor.feature browser=chrome url=$OLGURL
bundle exec cucumber /Volumes/Shared/Corporate/IT/QA/Projects/Automated_Testing/Online_Giving/OLG_Capybara_Selenium_Tests/features/CreateOffertoryFund.feature browser=chrome url=$OLGURL
bundle exec cucumber /Volumes/Shared/Corporate/IT/QA/Projects/Automated_Testing/Online_Giving/OLG_Capybara_Selenium_Tests/features/EditOffertoryFund.feature browser=chrome url=$OLGURL
bundle exec cucumber /Volumes/Shared/Corporate/IT/QA/Projects/Automated_Testing/Online_Giving/OLG_Capybara_Selenium_Tests/features/quickGive.feature browser=chrome url=$OLGURL
bundle exec cucumber /Volumes/Shared/Corporate/IT/QA/Projects/Automated_Testing/Online_Giving/OLG_Capybara_Selenium_Tests/features/quickGiveBankAccount.feature browser=chrome url=$OLGURL
bundle exec cucumber /Volumes/Shared/Corporate/IT/QA/Projects/Automated_Testing/Online_Giving/OLG_Capybara_Selenium_Tests/features/GiveOneTimeGift.feature browser=chrome url=$OLGURL
bundle exec cucumber /Volumes/Shared/Corporate/IT/QA/Projects/Automated_Testing/Online_Giving/OLG_Capybara_Selenium_Tests/features/CreateUserAccount.feature browser=chrome url=$OLGURL
bundle exec cucumber /Volumes/Shared/Corporate/IT/QA/Projects/Automated_Testing/Online_Giving/OLG_Capybara_Selenium_Tests/features/CreateUserAccountWithGift.feature browser=chrome url=$OLGURL

#TODO: echo TestComplete