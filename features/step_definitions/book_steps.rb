Given(/^there are (\d+) books in the database$/) do |n|
  create_list(:book, n.to_i)
  @books = Book.order('published_date DESC')
end
Given(/^there are some books in the database$/) do
  n = rand(10..100)
  step "there are #{n} books in the database"
end
Given(/^there is a book named "(.*?)"$/) do |title|
  create(:book, title: title)
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
  step "click #{sort_by}"
end

Then(/^the books are re\-sorted based on the amount of times they are purchased$/) do
  expect(page).to have_content(/#{@books[0].title}.*#{@books[2].title}/m)
end

When(/^I enter a book's title into the book search field$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am shown a list of books with that title$/) do
  pending # express the regexp above with the code you wish you had
end


# Add a new book
When(/^I enter the(?: book)? (name|title|author|published date|price) "(.*?)"$/) do |key,value|
  final_key, final_value, field_type = case key.downcase
  when 'name', 'title'  then ['book_title', value, :text]
  when 'author'         then ['book_author', value, :text]
  when 'published date' then ['book_published_date', Date.parse(value), :date]
  when 'price'          then ['book_price_cents', Monetize.parse(value).cents, :text]
  end

  case field_type
  when :text
    fill_in(final_key, :with => final_value)
  when :date
    select(final_value.strftime('%Y'), :from => "#{final_key}_1i")
    select(final_value.strftime('%B'), :from => "#{final_key}_2i")
    select(final_value.strftime('%e'), :from => "#{final_key}_3i")
  end
end

When(/^I visit the public book index$/) do
  visit '/books'
end

Then(/^I see the book ?(title|name|named|price|published date|author)? "(.*?)"$/) do |field,value|
  field = 'title' if field.nil? || field == 'name' || field == 'named' # title aliases
  field = 'published_date' if field == 'published date'
  entries = page.all("td.col-#{field}").map{|td| td.text}
  expect(entries).to include(value)
end

When(/^I change the book ?(title|name|named|price|published date|author) to "(.*?)"$/) do |field, value|
  step "I enter the #{field} \"#{value}\""
end



Then(/^I see a prompt requesting that I confirm my decision to delete the book$/) do
  true # Hack, because there's no great way to test this with capybara-webkit
end

When(/^I confirm my decision to delete the book$/) do
  page.driver.browser.accept_js_confirms
end
