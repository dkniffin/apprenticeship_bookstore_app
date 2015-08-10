When(/^I visit the site root path$/) do
  visit '/'
end

When(/^I click "?(.*?)"?$/) do |target|
  case target
  when 'submit'
    first('input[type="submit"]').click
  else
    click_on(target)
  end
end

Then(/^I am redirected to the book index page$/) do
  expect(current_path).to eq(root_path)
end
