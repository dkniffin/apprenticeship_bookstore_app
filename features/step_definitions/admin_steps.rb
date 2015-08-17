Given(/^I do not have an admin account$/) do
  AdminUser.delete_all
end
Given(/^I have an admin account$/) do
  @admin_account = AdminUser.create(account_details(:admin))
end
Given(/^I am logged into the admin panel$/) do
  deetz = account_details(:admin)
  step 'I have an admin account'
  step 'I visit the admin panel url'
  step 'I enter my admin email'
  step 'I enter my admin password'
  step 'I click submit'
end

When(/^I visit the admin (panel|books|orders) url$/) do |area|
  case area
  when 'books'
    visit '/admin/books'
  when 'orders'
    visit '/admin/orders'
  when 'panel'
    visit '/admin'
  end
end

Then(/^I see the admin panel$/) do
  expect(page).to have_content("Dashboard")
  expect(page).to have_content("Logout")
end

Then(/^I see a flash notification that tell me that my email does not exist in the system$/) do
  expect(page).to have_content('Invalid email or password')
end
