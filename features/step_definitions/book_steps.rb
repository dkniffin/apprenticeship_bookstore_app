Given(/^there are (\d+) books in the database$/) do |n|
  create_list(:book, n.to_i)
  @books = Book.order('published_date DESC')
end

Then(/^I see a list of books in the (?:database|bookstore)$/) do
  expect(page).to have_xpath("//th[contains(.,'Title')]")
  expect(page).to have_xpath("//th[contains(.,'Published date')]")
  expect(page).to have_xpath("//th[contains(.,'Author')]")
end

Then(/^the books are ordered by published date$/) do
  expect(page).to have_content(/#{@books[0].title}.*#{@books[2].title}/m)
end

Then(/^the list of (\d+) books are paginated in pages of (\d+) books per page$/) do |num_of_books, books_per_page|
  expect(page).to have_xpath("//tr[#{books_per_page.to_i}]")
  expect(page).to_not have_xpath("//tr[#{books_per_page.to_i+1}]")
end

When(/^I sort by "(.*?)"$/) do |sort_by|
  pending # express the regexp above with the code you wish you had
end

Then(/^the books are re\-sorted based on the amount of times they are purchased$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter a book's title into the book search field$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am shown a list of books with that title$/) do
  pending # express the regexp above with the code you wish you had
end


# Add a new book
When(/^I enter the book name "(.*?)"$/) do |value|
  fill_in('Title', :with => value)
end
When(/^I set the books price to "(.*?)"$/) do |price|
  fill_in('Price cents', :with => Monetize.parse(price).cents)
end


Then(/^I see the book on the admin panel index$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the Bookstore public book listing$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the book "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the book price "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^there is a book named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a prompt requesting that I confirm my decision to delete the book$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I confirm my decision to delete the book$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^there is a book named "(.*?)" valued at "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I change the book name to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I change the book price to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the new book's details on the admin panel$/) do
  pending # express the regexp above with the code you wish you had
end
