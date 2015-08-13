When(/^I visit my cart$/) do
  step 'I click "Cart"'
end

Then(/^the book is added to my cart(?: with quantity (\d+))?$/) do |quantity|
  books_in_cart = @account.cart.line_items.map(&:book)
  expect(books_in_cart).to include(@book)
  if quantity
    book_quantity = @account.cart.line_items.select{|li| li.book == @book}.map(&:quantity)
    expect(book_quantity).to include(quantity.to_i)
  end
end

Then(/^I see the book in my cart(?: with quantity (\d+))?$/) do |quantity|
  expect(page).to have_content(@book.title)
  if quantity
    expect(page).to have_field("line_item_quantity", with: quantity)
  end
end

Then(/^I am asked for(?: my)? (credit card|shipping address|billing address)$/) do |field|
  cap_field = field.split.map(&:capitalize).join(' ')
  expect(page).to have_content(cap_field)
end

When(/^I enter my (credit card|shipping address|billing address)$/) do |field|
  cap_field = field.split.map(&:capitalize).join(' ')
  case field
  when /address/i
    fill_in(cap_field, :with => "123 Main Street")
  when 'credit card'
    fill_in('Credit Card Number', :with => 4242424242424242)
    fill_in('CVV', :with => 123)
    select('1 - January', :from => "card_month")
    select('2030', :from => "card_year")
  end
end


Then(/^my credit card is saved for future purchases$/) do
  expect(@account.stripe_customer_token).to_not be_nil
end

Then(/^I am emailed an order invoice containing the books details, quantity, subtotal, and order total$/) do
  pending # express the regexp above with the code you wish you had
end


When(/^I enter (\d+) for the quantity$/) do |quantity|
  fill_in("Quantity", :with => quantity)
end

When /^I adjust the quantity of the book to (\d+)$/ do |quantity|
  line_item = @account.cart.line_items.select{|li| li.book == @book }.first
  within("form#edit_line_item_#{line_item.id}") do
    fill_in("line_item_quantity", :with => quantity)
  end
end

Then(/^I am asked if I want to use my already saved credit card$/) do
  expect(page).to have_content("Enter new payment info")
end
