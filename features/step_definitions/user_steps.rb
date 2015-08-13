Given(/^I do not have an account on the site$/) do
  User.delete_all
  @account = OpenStruct.new({:email => 'not.a.user@nowhere.invalid', :password => 'boguspassword'})
end
Given(/^I have an account on the site$/) do
  @account = User.create({ :email => 'test@test.com', :password => 'password123' })
end
Given(/^I log in$/) do
  step 'I visit the login page'
  step 'I enter my email'
  step 'I enter my password'
  step 'I click submit'
end
Given(/^I am logged into the site$/) do
  step 'I have an account on the site'
  step 'I log in'
end
Given(/^I have a credit card saved on the site$/) do
  @account.stripe_customer_token = "cus_6mdp1ktPtNooEj"
  @account.save!
end


When(/^I enter my(?:| correct) email(?:| address)$/) do
  fill_in('Email', :with => @account.email)
end
When(/^I enter "(.*?)" as my email address$/) do |value|
  fill_in('Email', :with => value)
end

When(/^I enter (?:my|the)( wrong| incorrect)? password$/) do |incorrect|
  pw = incorrect ? "incorrectPassword" : @account.password
  fill_in('Password', :with => pw)
end

When(/^I enter a password with correct(?: password)? confirmation$/) do
  fill_in('Password', :with => @account.password)
  fill_in('Password confirmation', :with => @account.password)
end
When(/^I enter a password with incorrect(?: password)? confirmation$/) do
  fill_in('Password', :with => @account.password)
  fill_in('Password confirmation', :with => "!thesame")
end



Then(/^I am presented with a login page$/) do
  expect(page).to have_content('Log in')
  expect(page).to have_xpath("//input[@type='email']")
  expect(page).to have_xpath("//input[@type='password']")
end

Then(/^I am notified that my password confirmation does not match$/) do
  expect(page).to have_content("Password confirmation doesn't match Password")
end

Then(/^I am notified that my password is incorrect$/) do
  expect(page).to have_content("Invalid email or password.")
end

Then(/^I am notified that my email address is invalid\.$/) do
  expect(page).to have_content('email')
  expect(page).to have_content('invalid')
end

Then(/^I am told to check my email for a confirmation link$/) do
  expect(page).to have_content('email')
  expect(page).to have_content('confirmation link')
end
