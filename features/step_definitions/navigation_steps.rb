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
