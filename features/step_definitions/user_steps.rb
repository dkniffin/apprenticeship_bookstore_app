user = {
  :email => 'test@test.com',
  :password => 'password123'
}

Given(/^I do not have an account on the site$/) do
  User.delete_all
end
Given(/^I have an account on the site$/) do
  User.create(user)
end


When(/^I enter my(?:| correct) email(?:| address)$/) do
  fill_in('Email', :with => user[:email])
end
When(/^I enter "(.*?)" as my email address$/) do |value|
  fill_in('Email', :with => value)
end

When(/^I enter.*(wrong|incorrect)? password$/) do |incorrect|
  pw = incorrect ? "incorrectPassword" : user[:password]
  fill_in('Password', :with => pw)
end

When(/^I enter a password with correct confirmation$/) do
  fill_in('Password', :with => user[:password])
  fill_in('Password confirmation', :with => user[:password])
end
When(/^I enter a password with incorrect confirmation$/) do
  fill_in('Password', :with => user[:password])
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

# Then(/^I am told to check my email for a confirmation link$/) do
#   expect(page).to have_content('email')
#   expect(page).to have_content('confirmation link')
# end
