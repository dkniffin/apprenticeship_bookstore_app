When(/^I visit my cart$/) do
  step 'I click "Cart"'
end

Then(/^I enter my credit card$/) do
  fill_in("Credit Card Number", 4242424242424242)
end

Then(/^the book is added to my cart$/) do
  books_in_cart = @account.cart.line_items.map(&:book).map(&:title)
  expect(books_in_cart).to include(@book)
end

Then(/^I see the book in my cart$/) do
  expect(page).to have_content(@book)
end

Then(/^I am asked for my shipping address$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter my shipping address$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am asked for my billing address$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter my billing address$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am asked for my credit card$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am asked to review the order total$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am shown the order summary$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^my credit card is saved for future purchases$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am emailed an order invoice containing the books details, quantity, subtotal, and order total$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter (\d+) for the quantity$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the book is added to my cart with quantity (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I adjust the quantity of the book that I want to (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see (\d+) displayed as the quantity of the book I want to purchase$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I have a credit card saved on the site$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am asked if I want to use my already saved credit card$/) do
  pending # express the regexp above with the code you wish you had
end
