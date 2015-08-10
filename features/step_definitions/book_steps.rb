Then(/^I am redirected to the book index shop page$/) do
  current_path.should == "/books"
end
