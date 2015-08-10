user = {
  :email => 'test@test.com',
  :password => 'password123'
}

Given(/^I do not have an account on the site$/) do
  User.delete_all
end


When(/^I enter my email address$/) do
  fill_in('Email', :with => user[:email])
end
When(/^I enter "(.*?)" as my email address$/) do |value|
  fill_in('Email', :with => value)
end


When(/^I enter a password with correct confirmation$/) do
  fill_in('Password', :with => user[:password])
  fill_in('Password confirmation', :with => user[:password])
end
When(/^I enter a password with incorrect confirmation$/) do
  fill_in('Password', :with => user[:password])
  fill_in('Password confirmation', :with => "!thesame")
end
