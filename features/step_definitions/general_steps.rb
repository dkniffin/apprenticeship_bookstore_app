When(/^I visit the(?: site)? root (?:path|url|page)$/) do
  visit '/'
end
When(/^I (?:visit|goto|go to) the login (?:path|page)$/) do
  visit new_user_session_path
end

When(/^I click "?(.*?)"?$/) do |target|
  case target
  when /submit/i
    first('input[type="submit"]').click
  when /(Edit|Delete)" for the book "(.*)/
    find(:xpath, "//tr[contains(.,'#{$2}')]/td/div/a", :text => $1).click
  when /on a book/i
    book_link = all(:xpath, "//tr[contains(@class,'row-book')]/td[contains(@class,'col-title')]/a").sample
    @book = book_link.text # Save for referencing later
    book_link.click
  else
    click_on(target)
  end
end

Then(/^I am redirected to the book index page$/) do
  expect(current_path).to eq(root_path)
end


Then(/^I( don't)? see "(.*?)"$/) do |negate, content|
  if negate
    expect(page).to_not have_content(content)
  else
    expect(page).to have_content(content)
  end
end
