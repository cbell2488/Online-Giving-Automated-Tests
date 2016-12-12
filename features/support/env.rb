

require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'rspec'
require 'pry'



Capybara.register_driver :selenium do |app|
 browser = (ENV['browser'] || 'firefox').to_sym
 Capybara::Selenium::Driver.new(app, browser: browser) 
 end
 
 Before do
 $appHost = (ENV['url'] || 'https://qa.osvonlinegiving.com').to_s
  puts $appHost
  end



Capybara.default_driver = :selenium
Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_max_wait_time = 15
Capybara.app_host = $appHost



