Given /^the following movies exist:$/ do |table|
  table.hashes.each do |row|
    Movie.create :title=> row['title'], :rating=> row['rating'], :release_date=> row['release_date'], :director=> row['director']
  end
end
Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  Movie.where(:title => arg1).first.director.should == arg2
end

Then(/^I should see "(.*?)" before "(.*?)"$/) do |arg1, arg2|
  assert page.body =~ /#{arg1}.*#{arg2}/m
end