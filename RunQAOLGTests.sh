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

bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/sysadmin_login.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/org_login.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/login_donor.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/CreateOffertoryFund.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/EditOffertoryFund.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/quickGive.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/quickGiveBankAccount.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/GiveOneTimeGift.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/GiveRecurringGift.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/GivePledgeGift.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/CreateUserAccount.feature browser=chrome url=$OLGURL
bundle exec cucumber /Users/cbell/RubymineProjects/Online-Giving-Automated-Tests/features/CreateUserAccountWithGift.feature browser=chrome url=$OLGURL

#TODO: echo TestComplete