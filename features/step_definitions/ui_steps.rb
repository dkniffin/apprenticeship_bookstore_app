Then(/^I am presented with a login page$/) do
  expect(page).to have_content('Log in')
  expect(page).to have_xpath("//input[@type='email']")
  expect(page).to have_xpath("//input[@type='password']")
end

Then(/^I am notified that my password confirmation does not match$/) do
  expect(page).to have_content("Password confirmation doesn't match Password")
end

Then(/^I am notified that my email address is invalid\.$/) do
  expect(page).to have_content('email')
  expect(page).to have_content('invalid')
end

# Then(/^I am told to check my email for a confirmation link$/) do
#   expect(page).to have_content('email')
#   expect(page).to have_content('confirmation link')
# end
