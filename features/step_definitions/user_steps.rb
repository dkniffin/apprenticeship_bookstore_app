Given(/^I do not have an account on the site$/) do
  User.delete_all
end
Given(/^I have an account on the site$/) do
  @account_id = User.create(account_details(:valid_user)).id

  allow_any_instance_of(User).to receive(:save_card) do |this|
    this.stripe_customer_token = "cus_6mdp1ktPtNooEj"
    this.save!
  end

  allow_any_instance_of(Order).to receive(:charge_card) { true }
end
Given(/^My account is confirmed$/) do
  expect(unread_emails_for(account.email).size).to eql 1
  open_last_email_for(account.email)
  click_email_link_matching /confirm/
end
Given(/^I log in$/) do
  step 'I visit the login page'
  step 'I enter my email'
  step 'I enter my password'
  step 'I click submit'
end
Given(/^I am logged into the site$/) do
  step 'I have an account on the site'
  step 'My account is confirmed'
  step 'I log in'
end
Given(/^I have a credit card saved on the site$/) do
  account.update({:stripe_customer_token => "cus_6mdp1ktPtNooEj"})
  account.save!
end


When(/^I enter my(?:| correct)( admin)? email(?:| address)$/) do |admin|
  deetz = admin ? account_details(:admin) : account_details(:valid_user)
  step "I enter \"#{deetz[:email]}\" as my email address"
end
When(/^I enter "(.*?)" as my email address$/) do |value|
  fill_in('Email', :with => value)
end

When(/^I enter (?:my|the)( wrong| incorrect)?( admin)? password$/) do |incorrect,admin|
  deetz = admin ? account_details(:admin) : account_details(:valid_user)
  deetz = account_details(:invalid_user) if incorrect
  step "I enter \"#{deetz[:password]}\" as my password"
end
When(/^I enter "(.*?)" as my password$/) do |pw|
  fill_in('Password', :with => pw)
end

When(/^I enter a password with (in)?correct(?: password)? confirmation$/) do |incorrect|
  pw = incorrect ? "!thesame" : account_details(:valid_user)[:password]
  fill_in('Password', :with => account_details(:valid_user)[:password])
  fill_in('Password confirmation', :with => pw)
end

When(/^I visit the link in that email$/) do
  open_last_email_for(account.email)
  click_email_link_matching /confirm/
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
  expect(page).to have_content('Email is invalid')
end

Then(/^I am told to check my email for a confirmation link$/) do
  expect(page).to have_content('email')
  expect(page).to have_content('confirmation link')
end

Then(/^I am sent a confirmation email$/) do
  @account_id = User.last.id
  expect(unread_emails_for(account.email).size).to eql 1
end

Then(/^My email address becomes confirmed$/) do
  expect(User.first.confirmed_at).to_not be_nil
end

Then(/^my credit card is saved for future purchases$/) do
  expect(account.stripe_customer_token).to_not be_nil
end
