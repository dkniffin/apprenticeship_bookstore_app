Given(/^there are (\d+) books in the database$/) do |n|
  create_list(:book, n.to_i)
end

Then(/^I see a list of books in the database$/) do
  books = Book.order('published_date DESC')
  # expect(assigns(:books)).to eq(books)
  (0..10).each do |i|
    expect(page).to have_content(books[i].title)
  end
end

Then(/^the books are ordered by published date$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the list of (\d+) books are paginated in pages of (\d+) books per page$/) do |num_of_books, books_per_page|
  pending # express the regexp above with the code you wish you had
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
